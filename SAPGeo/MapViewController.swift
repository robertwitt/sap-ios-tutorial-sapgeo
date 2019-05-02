//
//  MapViewController.swift
//  SAPGeo
//
//  Created by Robert Witt on 02.05.19.
//  Copyright © 2019 SAP. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import SAPCommon
import SAPFioriFlows
import SAPOData

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    private var locationManager = CLLocationManager()
    private let logger = Logger.shared(named: "MapViewControllerLogger")
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self
        
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        
        loadLocations()
    }
    
    /**
     Loads all geolocations from OData service on SAP Cloud Platform
     */
    func loadLocations() {
        guard let sapGeoService = OnboardingSessionManager.shared.onboardingSession?.odataController.sapGeoService else {
            AlertHelper.displayAlert(with: "OData service is not reachable, please onboard again.", error: nil, viewController: self)
            return
        }
        
        sapGeoService.fetchGeoLocation() { (geolocations, error) in
            guard let geolocations = geolocations else {
                return
            }
            
            let locations = self.getArrayOfSAPGeoLocationsFromEntities(locations: geolocations)
            // Uncomment line below later in the tutorial
            self.storeLocationsToUserDefaults(locations: locations)
            self.renderLocationsOnMap(locations: locations)
        }
    }
    
    @IBAction func zoomToGeofence(_ sender: Any) {
        if mapView.selectedAnnotations.count > 0 {
            let selected = mapView.selectedAnnotations[0]
            let region = MKCoordinateRegion(center: selected.coordinate, latitudinalMeters: 250, longitudinalMeters: 250)
            mapView.setRegion(region, animated: true)
        }
    }
    
    /**
     Converts array of `GeoLocationType` objects to array of `SAPGeoLocation` objects, for convenience.
     - Parameters:
     - locations: Array of `GeoLocationType` entities
     - Returns: Array of `SAPGeoLocation` objects
     */
    private func getArrayOfSAPGeoLocationsFromEntities(locations: [GeoLocationType]) -> [SAPGeoLocation] {
        var sapGeoLocations: [SAPGeoLocation] = []
        for location in locations {
            let sapGeoLocation = SAPGeoLocation(geoLocationType: location)
            sapGeoLocations.append(sapGeoLocation)
        }
        return sapGeoLocations
    }
    
    /**
     Renders all geolocations on the map
     - Parameters:
     - locations: Array of `SAPGeoLocation` entities
     */
    private func renderLocationsOnMap(locations: [SAPGeoLocation]) {
        for location in locations {
            mapView.addAnnotation(location)
            mapView.addOverlay(MKCircle(center: location.coordinate, radius: location.radius))
            
            // Uncomment line below later in the tutorial
            registerGeofence(location: location)
        }
    }
    
    /**
     Add locations to `UserDefaults` for offline access
     - Parameters:
     - locations: Array of `SAPGeoLocation` entities
     */
    private func storeLocationsToUserDefaults(locations: [SAPGeoLocation]) {
        var listSAPGeoLocations: [Data] = []
        for item in locations {
            let sapGeoLocation = NSKeyedArchiver.archivedData(withRootObject: item)
            listSAPGeoLocations.append(sapGeoLocation)
        }
        
        UserDefaults.standard.set(listSAPGeoLocations, forKey: "geofences")
    }
    
    /**
     Registers a region to location manager and start monitoring for crossing the geofence
     - Parameters:
     - location: The `SAPGeoLocation` object which will be registered as a geofence
     */
    private func registerGeofence(location: SAPGeoLocation) {
        let region = getRegionForLocation(location: location)
        
        locationManager.startMonitoring(for: region)
    }
    
    /**
     Returns a circular geofence region
     - Parameters:
     - location: The `SAPGeoLocation` object which will be used to define the geofence
     - Returns: Instance of `CLCircularRegion`
     */
    private func getRegionForLocation(location: SAPGeoLocation) -> CLCircularRegion {
        let region = CLCircularRegion(center: location.coordinate, radius: location.radius, identifier: location.identifier!)
        region.notifyOnEntry = true
        region.notifyOnExit = false
        return region
    }

}

// MARK: - Map View Delegate
extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? SAPGeoLocation {
            let identifier = "pin"
            var view: MKPinAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
                as? MKPinAnnotationView {
                dequeuedView.annotation = annotation
                view = dequeuedView
            } else {
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure) as UIView
            }
            view.pinTintColor = UIColor.preferredFioriColor(forStyle: .tintColorDark)
            
            return view
        }
        return nil
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if overlay is MKCircle {
            let circleRenderer = MKCircleRenderer(overlay: overlay)
            circleRenderer.lineWidth = 1.0
            circleRenderer.strokeColor = UIColor.preferredFioriColor(forStyle: .tintColorDark)
            circleRenderer.fillColor = UIColor.preferredFioriColor(forStyle: .tintColorLight).withAlphaComponent(0.4)
            return circleRenderer
        }
        return MKOverlayRenderer(overlay: overlay)
    }

}

// MARK: - Location Manager Delegate
extension MapViewController: CLLocationManagerDelegate {
    
    // Allow access to your current location if the "always" authorization is set (see r:25)
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        mapView.showsUserLocation = status == .authorizedAlways
    }
    
    func locationManager(_ manager: CLLocationManager, monitoringDidFailFor region: CLRegion?, withError error: Error) {
        logger.error("Monitoring did fail for region: \(region!.identifier)")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        logger.error("Location Manager did fail with error: \(error)")
    }
    
}
