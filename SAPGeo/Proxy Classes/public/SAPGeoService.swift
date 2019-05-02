// # Proxy Compiler 19.1.3-b8851a-20190408

import Foundation
import SAPOData

open class SAPGeoService<Provider: DataServiceProvider>: DataService<Provider> {
    public override init(provider: Provider) {
        super.init(provider: provider)
        self.provider.metadata = SAPGeoServiceMetadata.document
    }

    open func fetchGeoLocation(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> [GeoLocationType] {
        let var_query = DataQuery.newIfNull(query: query)
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try GeoLocationType.array(from: self.executeQuery(var_query.fromDefault(SAPGeoServiceMetadata.EntitySets.geoLocation), headers: var_headers, options: var_options).entityList())
    }

    open func fetchGeoLocation(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping ([GeoLocationType]?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchGeoLocation(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchGeoLocationType(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> GeoLocationType {
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try CastRequired<GeoLocationType>.from(self.executeQuery(query.fromDefault(SAPGeoServiceMetadata.EntitySets.geoLocation), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchGeoLocationType(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (GeoLocationType?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchGeoLocationType(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchGeoLocationTypeWithKey(id: String?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> GeoLocationType {
        let var_query = DataQuery.newIfNull(query: query)
        return try self.fetchGeoLocationType(matching: var_query.withKey(GeoLocationType.key(id: id)), headers: headers, options: options)
    }

    open func fetchGeoLocationTypeWithKey(id: String?, query: DataQuery?, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (GeoLocationType?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchGeoLocationTypeWithKey(id: id, query: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    @available(swift, deprecated: 4.0, renamed: "fetchGeoLocation")
    open func geoLocation(query: DataQuery = DataQuery()) throws -> [GeoLocationType] {
        return try self.fetchGeoLocation(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchGeoLocation")
    open func geoLocation(query: DataQuery = DataQuery(), completionHandler: @escaping ([GeoLocationType]?, Error?) -> Void) {
        self.fetchGeoLocation(matching: query, headers: nil, options: nil, completionHandler: completionHandler)
    }

    open override func refreshMetadata() throws {
        objc_sync_enter(self)
        defer { objc_sync_exit(self) }
        do {
            try ProxyInternal.refreshMetadata(service: self, fetcher: nil, options: SAPGeoServiceMetadataParser.options)
            SAPGeoServiceMetadataChanges.merge(metadata: self.metadata)
        }
    }
}
