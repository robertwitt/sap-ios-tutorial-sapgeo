// # Proxy Compiler 19.1.3-b8851a-20190408

import Foundation
import SAPOData

open class GeoLocationType: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private static var id_: Property = SAPGeoServiceMetadata.EntityTypes.geoLocationType.property(withName: "ID")

    private static var title_: Property = SAPGeoServiceMetadata.EntityTypes.geoLocationType.property(withName: "Title")

    private static var description_: Property = SAPGeoServiceMetadata.EntityTypes.geoLocationType.property(withName: "Description")

    private static var latitude_: Property = SAPGeoServiceMetadata.EntityTypes.geoLocationType.property(withName: "Latitude")

    private static var longitude_: Property = SAPGeoServiceMetadata.EntityTypes.geoLocationType.property(withName: "Longitude")

    private static var radius_: Property = SAPGeoServiceMetadata.EntityTypes.geoLocationType.property(withName: "Radius")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: SAPGeoServiceMetadata.EntityTypes.geoLocationType)
    }

    open class func array(from: EntityValueList) -> [GeoLocationType] {
        return ArrayConverter.convert(from.toArray(), [GeoLocationType]())
    }

    open func copy() -> GeoLocationType {
        return CastRequired<GeoLocationType>.from(self.copyEntity())
    }

    open class var description: Property {
        get {
            objc_sync_enter(GeoLocationType.self)
            defer { objc_sync_exit(GeoLocationType.self) }
            do {
                return GeoLocationType.description_
            }
        }
        set(value) {
            objc_sync_enter(GeoLocationType.self)
            defer { objc_sync_exit(GeoLocationType.self) }
            do {
                GeoLocationType.description_ = value
            }
        }
    }

    open var description: String? {
        get {
            return StringValue.optional(self.optionalValue(for: GeoLocationType.description))
        }
        set(value) {
            self.setOptionalValue(for: GeoLocationType.description, to: StringValue.of(optional: value))
        }
    }

    open class var id: Property {
        get {
            objc_sync_enter(GeoLocationType.self)
            defer { objc_sync_exit(GeoLocationType.self) }
            do {
                return GeoLocationType.id_
            }
        }
        set(value) {
            objc_sync_enter(GeoLocationType.self)
            defer { objc_sync_exit(GeoLocationType.self) }
            do {
                GeoLocationType.id_ = value
            }
        }
    }

    open var id: String? {
        get {
            return StringValue.optional(self.optionalValue(for: GeoLocationType.id))
        }
        set(value) {
            self.setOptionalValue(for: GeoLocationType.id, to: StringValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(id: String?) -> EntityKey {
        return EntityKey().with(name: "ID", value: StringValue.of(optional: id))
    }

    open class var latitude: Property {
        get {
            objc_sync_enter(GeoLocationType.self)
            defer { objc_sync_exit(GeoLocationType.self) }
            do {
                return GeoLocationType.latitude_
            }
        }
        set(value) {
            objc_sync_enter(GeoLocationType.self)
            defer { objc_sync_exit(GeoLocationType.self) }
            do {
                GeoLocationType.latitude_ = value
            }
        }
    }

    open var latitude: Double? {
        get {
            return DoubleValue.optional(self.optionalValue(for: GeoLocationType.latitude))
        }
        set(value) {
            self.setOptionalValue(for: GeoLocationType.latitude, to: DoubleValue.of(optional: value))
        }
    }

    open class var longitude: Property {
        get {
            objc_sync_enter(GeoLocationType.self)
            defer { objc_sync_exit(GeoLocationType.self) }
            do {
                return GeoLocationType.longitude_
            }
        }
        set(value) {
            objc_sync_enter(GeoLocationType.self)
            defer { objc_sync_exit(GeoLocationType.self) }
            do {
                GeoLocationType.longitude_ = value
            }
        }
    }

    open var longitude: Double? {
        get {
            return DoubleValue.optional(self.optionalValue(for: GeoLocationType.longitude))
        }
        set(value) {
            self.setOptionalValue(for: GeoLocationType.longitude, to: DoubleValue.of(optional: value))
        }
    }

    open var old: GeoLocationType {
        return CastRequired<GeoLocationType>.from(self.oldEntity)
    }

    open class var radius: Property {
        get {
            objc_sync_enter(GeoLocationType.self)
            defer { objc_sync_exit(GeoLocationType.self) }
            do {
                return GeoLocationType.radius_
            }
        }
        set(value) {
            objc_sync_enter(GeoLocationType.self)
            defer { objc_sync_exit(GeoLocationType.self) }
            do {
                GeoLocationType.radius_ = value
            }
        }
    }

    open var radius: Double? {
        get {
            return DoubleValue.optional(self.optionalValue(for: GeoLocationType.radius))
        }
        set(value) {
            self.setOptionalValue(for: GeoLocationType.radius, to: DoubleValue.of(optional: value))
        }
    }

    open class var title: Property {
        get {
            objc_sync_enter(GeoLocationType.self)
            defer { objc_sync_exit(GeoLocationType.self) }
            do {
                return GeoLocationType.title_
            }
        }
        set(value) {
            objc_sync_enter(GeoLocationType.self)
            defer { objc_sync_exit(GeoLocationType.self) }
            do {
                GeoLocationType.title_ = value
            }
        }
    }

    open var title: String? {
        get {
            return StringValue.optional(self.optionalValue(for: GeoLocationType.title))
        }
        set(value) {
            self.setOptionalValue(for: GeoLocationType.title, to: StringValue.of(optional: value))
        }
    }
}
