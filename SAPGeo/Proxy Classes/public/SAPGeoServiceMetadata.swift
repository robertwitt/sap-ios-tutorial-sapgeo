// # Proxy Compiler 19.1.3-b8851a-20190408

import Foundation
import SAPOData

public class SAPGeoServiceMetadata {
    private static var document_: CSDLDocument = SAPGeoServiceMetadata.resolve()

    public static var document: CSDLDocument {
        get {
            objc_sync_enter(SAPGeoServiceMetadata.self)
            defer { objc_sync_exit(SAPGeoServiceMetadata.self) }
            do {
                return SAPGeoServiceMetadata.document_
            }
        }
        set(value) {
            objc_sync_enter(SAPGeoServiceMetadata.self)
            defer { objc_sync_exit(SAPGeoServiceMetadata.self) }
            do {
                SAPGeoServiceMetadata.document_ = value
            }
        }
    }

    private static func resolve() -> CSDLDocument {
        try! SAPGeoServiceFactory.registerAll()
        SAPGeoServiceMetadataParser.parsed.hasGeneratedProxies = true
        return SAPGeoServiceMetadataParser.parsed
    }

    public class EntityTypes {
        private static var geoLocationType_: EntityType = SAPGeoServiceMetadataParser.parsed.entityType(withName: "sapgeo.SAPGeoService.GeoLocationType")

        public static var geoLocationType: EntityType {
            get {
                objc_sync_enter(SAPGeoServiceMetadata.EntityTypes.self)
                defer { objc_sync_exit(SAPGeoServiceMetadata.EntityTypes.self) }
                do {
                    return SAPGeoServiceMetadata.EntityTypes.geoLocationType_
                }
            }
            set(value) {
                objc_sync_enter(SAPGeoServiceMetadata.EntityTypes.self)
                defer { objc_sync_exit(SAPGeoServiceMetadata.EntityTypes.self) }
                do {
                    SAPGeoServiceMetadata.EntityTypes.geoLocationType_ = value
                }
            }
        }
    }

    public class EntitySets {
        private static var geoLocation_: EntitySet = SAPGeoServiceMetadataParser.parsed.entitySet(withName: "GeoLocation")

        public static var geoLocation: EntitySet {
            get {
                objc_sync_enter(SAPGeoServiceMetadata.EntitySets.self)
                defer { objc_sync_exit(SAPGeoServiceMetadata.EntitySets.self) }
                do {
                    return SAPGeoServiceMetadata.EntitySets.geoLocation_
                }
            }
            set(value) {
                objc_sync_enter(SAPGeoServiceMetadata.EntitySets.self)
                defer { objc_sync_exit(SAPGeoServiceMetadata.EntitySets.self) }
                do {
                    SAPGeoServiceMetadata.EntitySets.geoLocation_ = value
                }
            }
        }
    }
}
