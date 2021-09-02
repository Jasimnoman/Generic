//
//  MostViewedModel.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on September 2, 2021

import Foundation
import SwiftyJSON


class MostViewedModel : NSObject, NSCoding{

    var abstractField : String!
    var adxKeywords : String!
    var assetId : Int!
    var byline : String!
    var column : String!
    var desFacet : [String]!
    var etaId : Int!
    var geoFacet : [String]!
    var id : Int!
    var media : [Media]!
    var nytdsection : String!
    var orgFacet : [String]!
    var perFacet : [String]!
    var publishedDate : String!
    var section : String!
    var source : String!
    var subsection : String!
    var title : String!
    var type : String!
    var updated : String!
    var uri : String!
    var url : String!

	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
        abstractField = json["abstract"].stringValue
        adxKeywords = json["adx_keywords"].stringValue
        assetId = json["asset_id"].intValue
        byline = json["byline"].stringValue
        column = json["column"].stringValue
        desFacet = [String]()
        let desFacetArray = json["des_facet"].arrayValue
        for desFacetJson in desFacetArray{
            desFacet.append(desFacetJson.stringValue)
        }
        etaId = json["eta_id"].intValue
        geoFacet = [String]()
        let geoFacetArray = json["geo_facet"].arrayValue
        for geoFacetJson in geoFacetArray{
            geoFacet.append(geoFacetJson.stringValue)
        }
        id = json["id"].intValue
        media = [Media]()
        let mediaArray = json["media"]
        for mediaJson in mediaArray{
            let value = Media(fromJson: mediaJson.1)
            media.append(value)
        }
        nytdsection = json["nytdsection"].stringValue
        orgFacet = [String]()
        let orgFacetArray = json["org_facet"].arrayValue
        for orgFacetJson in orgFacetArray{
            orgFacet.append(orgFacetJson.stringValue)
        }
        perFacet = [String]()
        let perFacetArray = json["per_facet"].arrayValue
        for perFacetJson in perFacetArray{
            perFacet.append(perFacetJson.stringValue)
        }
        publishedDate = json["published_date"].stringValue
        section = json["section"].stringValue
        source = json["source"].stringValue
        subsection = json["subsection"].stringValue
        title = json["title"].stringValue
        type = json["type"].stringValue
        updated = json["updated"].stringValue
        uri = json["uri"].stringValue
        url = json["url"].stringValue
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
        if abstractField != nil{
        	dictionary["abstract"] = abstractField
        }
        if adxKeywords != nil{
        	dictionary["adx_keywords"] = adxKeywords
        }
        if assetId != nil{
        	dictionary["asset_id"] = assetId
        }
        if byline != nil{
        	dictionary["byline"] = byline
        }
        if column != nil{
        	dictionary["column"] = column
        }
        if desFacet != nil{
        	dictionary["des_facet"] = desFacet
        }
        if etaId != nil{
        	dictionary["eta_id"] = etaId
        }
        if geoFacet != nil{
        	dictionary["geo_facet"] = geoFacet
        }
        if id != nil{
        	dictionary["id"] = id
        }
        if media != nil{
        var dictionaryElements = [[String:Any]]()
        for mediaElement in media {
        	dictionaryElements.append(mediaElement.toDictionary())
        }
        dictionary["media"] = dictionaryElements
        }
        if nytdsection != nil{
        	dictionary["nytdsection"] = nytdsection
        }
        if orgFacet != nil{
        	dictionary["org_facet"] = orgFacet
        }
        if perFacet != nil{
        	dictionary["per_facet"] = perFacet
        }
        if publishedDate != nil{
        	dictionary["published_date"] = publishedDate
        }
        if section != nil{
        	dictionary["section"] = section
        }
        if source != nil{
        	dictionary["source"] = source
        }
        if subsection != nil{
        	dictionary["subsection"] = subsection
        }
        if title != nil{
        	dictionary["title"] = title
        }
        if type != nil{
        	dictionary["type"] = type
        }
        if updated != nil{
        	dictionary["updated"] = updated
        }
        if uri != nil{
        	dictionary["uri"] = uri
        }
        if url != nil{
        	dictionary["url"] = url
        }
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
		abstractField = aDecoder.decodeObject(forKey: "abstract") as? String
		adxKeywords = aDecoder.decodeObject(forKey: "adx_keywords") as? String
		assetId = aDecoder.decodeObject(forKey: "asset_id") as? Int
		byline = aDecoder.decodeObject(forKey: "byline") as? String
		column = aDecoder.decodeObject(forKey: "column") as? String
		desFacet = aDecoder.decodeObject(forKey: "des_facet") as? [String]
		etaId = aDecoder.decodeObject(forKey: "eta_id") as? Int
		geoFacet = aDecoder.decodeObject(forKey: "geo_facet") as? [String]
		id = aDecoder.decodeObject(forKey: "id") as? Int
		media = aDecoder.decodeObject(forKey: "media") as? [Media]
		nytdsection = aDecoder.decodeObject(forKey: "nytdsection") as? String
		orgFacet = aDecoder.decodeObject(forKey: "org_facet") as? [String]
		perFacet = aDecoder.decodeObject(forKey: "per_facet") as? [String]
		publishedDate = aDecoder.decodeObject(forKey: "published_date") as? String
		section = aDecoder.decodeObject(forKey: "section") as? String
		source = aDecoder.decodeObject(forKey: "source") as? String
		subsection = aDecoder.decodeObject(forKey: "subsection") as? String
		title = aDecoder.decodeObject(forKey: "title") as? String
		type = aDecoder.decodeObject(forKey: "type") as? String
		updated = aDecoder.decodeObject(forKey: "updated") as? String
		uri = aDecoder.decodeObject(forKey: "uri") as? String
		url = aDecoder.decodeObject(forKey: "url") as? String
	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
	{
		if abstractField != nil{
			aCoder.encode(abstractField, forKey: "abstract")
		}
		if adxKeywords != nil{
			aCoder.encode(adxKeywords, forKey: "adx_keywords")
		}
		if assetId != nil{
			aCoder.encode(assetId, forKey: "asset_id")
		}
		if byline != nil{
			aCoder.encode(byline, forKey: "byline")
		}
		if column != nil{
			aCoder.encode(column, forKey: "column")
		}
		if desFacet != nil{
			aCoder.encode(desFacet, forKey: "des_facet")
		}
		if etaId != nil{
			aCoder.encode(etaId, forKey: "eta_id")
		}
		if geoFacet != nil{
			aCoder.encode(geoFacet, forKey: "geo_facet")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if media != nil{
			aCoder.encode(media, forKey: "media")
		}
		if nytdsection != nil{
			aCoder.encode(nytdsection, forKey: "nytdsection")
		}
		if orgFacet != nil{
			aCoder.encode(orgFacet, forKey: "org_facet")
		}
		if perFacet != nil{
			aCoder.encode(perFacet, forKey: "per_facet")
		}
		if publishedDate != nil{
			aCoder.encode(publishedDate, forKey: "published_date")
		}
		if section != nil{
			aCoder.encode(section, forKey: "section")
		}
		if source != nil{
			aCoder.encode(source, forKey: "source")
		}
		if subsection != nil{
			aCoder.encode(subsection, forKey: "subsection")
		}
		if title != nil{
			aCoder.encode(title, forKey: "title")
		}
		if type != nil{
			aCoder.encode(type, forKey: "type")
		}
		if updated != nil{
			aCoder.encode(updated, forKey: "updated")
		}
		if uri != nil{
			aCoder.encode(uri, forKey: "uri")
		}
		if url != nil{
			aCoder.encode(url, forKey: "url")
		}

	}

}
