// # Proxy Compiler 19.1.3-b8851a-20190408

import Foundation
import SAPOData

internal class SAPGeoServiceFactory {
    static func registerAll() throws {
        SAPGeoServiceMetadata.EntityTypes.geoLocationType.registerFactory(ObjectFactory.with(create: { GeoLocationType(withDefaults: false) }, createWithDecoder: { d in try GeoLocationType(from: d) }))
        SAPGeoServiceStaticResolver.resolve()
    }
}
