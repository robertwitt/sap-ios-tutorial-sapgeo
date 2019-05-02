// # Proxy Compiler 19.1.3-b8851a-20190408

import Foundation
import SAPOData

internal class SAPGeoServiceMetadataParser {
    internal static let options: Int = (CSDLOption.allowCaseConflicts | CSDLOption.disableFacetWarnings | CSDLOption.disableNameValidation | CSDLOption.processMixedVersions | CSDLOption.retainOriginalText | CSDLOption.ignoreUndefinedTerms)

    internal static let parsed: CSDLDocument = SAPGeoServiceMetadataParser.parse()

    static func parse() -> CSDLDocument {
        let parser = CSDLParser()
        parser.logWarnings = false
        parser.csdlOptions = SAPGeoServiceMetadataParser.options
        let metadata = parser.parseInProxy(SAPGeoServiceMetadataText.xml, url: "sapgeo.SAPGeoService")
        metadata.proxyVersion = "19.1.3-b8851a-20190408"
        return metadata
    }
}
