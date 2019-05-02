// # Proxy Compiler 19.1.3-b8851a-20190408

import Foundation
import SAPOData

internal class SAPGeoServiceStaticResolver {
    static func resolve() {
        SAPGeoServiceStaticResolver.resolve1()
    }

    private static func resolve1() {
        Ignore.valueOf_any(SAPGeoServiceMetadata.EntityTypes.geoLocationType)
        Ignore.valueOf_any(SAPGeoServiceMetadata.EntitySets.geoLocation)
        Ignore.valueOf_any(GeoLocationType.id)
        Ignore.valueOf_any(GeoLocationType.title)
        Ignore.valueOf_any(GeoLocationType.description)
        Ignore.valueOf_any(GeoLocationType.latitude)
        Ignore.valueOf_any(GeoLocationType.longitude)
        Ignore.valueOf_any(GeoLocationType.radius)
    }
}
