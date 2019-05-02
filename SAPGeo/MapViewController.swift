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

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    private var locationManager = CLLocationManager()
    private let logger = Logger.shared(named: "MapViewControllerLogger")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self
        
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
    }

}

// MARK: - Map View Delegate
extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // TODO: Implement later!
        return nil
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        // TODO: Implement later!
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
