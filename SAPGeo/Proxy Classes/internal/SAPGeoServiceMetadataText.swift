// # Proxy Compiler 19.1.3-b8851a-20190408

import Foundation
import SAPOData

internal class SAPGeoServiceMetadataText {
    internal static let xml: String = "<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?><edmx:Edmx Version=\"1.0\" xmlns:edmx=\"http://schemas.microsoft.com/ado/2007/06/edmx\"><edmx:DataServices xmlns:m=\"http://schemas.microsoft.com/ado/2007/08/dataservices/metadata\" m:DataServiceVersion=\"2.0\"><Schema Namespace=\"sapgeo.SAPGeoService\" xmlns:d=\"http://schemas.microsoft.com/ado/2007/08/dataservices\" xmlns:m=\"http://schemas.microsoft.com/ado/2007/08/dataservices/metadata\" xmlns=\"http://schemas.microsoft.com/ado/2008/09/edm\"><EntityType Name=\"GeoLocationType\"><Key><PropertyRef Name=\"ID\" /></Key><Property Name=\"ID\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"36\" /><Property Name=\"Title\" Type=\"Edm.String\" MaxLength=\"32\" /><Property Name=\"Description\" Type=\"Edm.String\" MaxLength=\"256\" /><Property Name=\"Latitude\" Type=\"Edm.Double\" /><Property Name=\"Longitude\" Type=\"Edm.Double\" /><Property Name=\"Radius\" Type=\"Edm.Double\" /></EntityType><EntityContainer Name=\"SAPGeoService\" m:IsDefaultEntityContainer=\"true\"><EntitySet Name=\"GeoLocation\" EntityType=\"sapgeo.SAPGeoService.GeoLocationType\" /></EntityContainer></Schema></edmx:DataServices></edmx:Edmx>\n"
}
