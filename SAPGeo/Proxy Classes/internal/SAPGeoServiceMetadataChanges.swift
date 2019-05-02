// # Proxy Compiler 19.1.3-b8851a-20190408

import Foundation
import SAPOData

internal class SAPGeoServiceMetadataChanges {
    static func merge(metadata: CSDLDocument) {
        metadata.hasGeneratedProxies = true
        SAPGeoServiceMetadata.document = metadata
        SAPGeoServiceMetadataChanges.merge1(metadata: metadata)
        try! SAPGeoServiceFactory.registerAll()
    }

    private static func merge1(metadata: CSDLDocument) {
        Ignore.valueOf_any(metadata)
        if !SAPGeoServiceMetadata.EntityTypes.geoLocationType.isRemoved {
            SAPGeoServiceMetadata.EntityTypes.geoLocationType = metadata.entityType(withName: "sapgeo.SAPGeoService.GeoLocationType")
        }
        if !SAPGeoServiceMetadata.EntitySets.geoLocation.isRemoved {
            SAPGeoServiceMetadata.EntitySets.geoLocation = metadata.entitySet(withName: "GeoLocation")
        }
        if !GeoLocationType.id.isRemoved {
            GeoLocationType.id = SAPGeoServiceMetadata.EntityTypes.geoLocationType.property(withName: "ID")
        }
        if !GeoLocationType.title.isRemoved {
            GeoLocationType.title = SAPGeoServiceMetadata.EntityTypes.geoLocationType.property(withName: "Title")
        }
        if !GeoLocationType.description.isRemoved {
            GeoLocationType.description = SAPGeoServiceMetadata.EntityTypes.geoLocationType.property(withName: "Description")
        }
        if !GeoLocationType.latitude.isRemoved {
            GeoLocationType.latitude = SAPGeoServiceMetadata.EntityTypes.geoLocationType.property(withName: "Latitude")
        }
        if !GeoLocationType.longitude.isRemoved {
            GeoLocationType.longitude = SAPGeoServiceMetadata.EntityTypes.geoLocationType.property(withName: "Longitude")
        }
        if !GeoLocationType.radius.isRemoved {
            GeoLocationType.radius = SAPGeoServiceMetadata.EntityTypes.geoLocationType.property(withName: "Radius")
        }
    }
}
