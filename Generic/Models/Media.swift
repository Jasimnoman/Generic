//
//  Media.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on September 2, 2021

import Foundation
import SwiftyJSON


class Media : NSObject, NSCoding{

    var approvedForSyndication : Int!
    var caption : String!
    var copyright : String!
    var mediaMetadata : [MediaMetadatum]!
    var subtype : String!
    var type : String!

	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
        approvedForSyndication = json["approved_for_syndication"].intValue
        caption = json["caption"].stringValue
        copyright = json["copyright"].stringValue
        mediaMetadata = [MediaMetadatum]()
        let mediaMetadataArray = json["media-metadata"]
        for mediaMetadataJson in mediaMetadataArray{
            let value = MediaMetadatum(fromJson: mediaMetadataJson.1)
            mediaMetadata.append(value)
        }
        subtype = json["subtype"].stringValue
        type = json["type"].stringValue
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
        if approvedForSyndication != nil{
        	dictionary["approved_for_syndication"] = approvedForSyndication
        }
        if caption != nil{
        	dictionary["caption"] = caption
        }
        if copyright != nil{
        	dictionary["copyright"] = copyright
        }
        if mediaMetadata != nil{
        var dictionaryElements = [[String:Any]]()
        for mediaMetadataElement in mediaMetadata {
        	dictionaryElements.append(mediaMetadataElement.toDictionary())
        }
        dictionary["mediaMetadata"] = dictionaryElements
        }
        if subtype != nil{
        	dictionary["subtype"] = subtype
        }
        if type != nil{
        	dictionary["type"] = type
        }
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
		approvedForSyndication = aDecoder.decodeObject(forKey: "approved_for_syndication") as? Int
		caption = aDecoder.decodeObject(forKey: "caption") as? String
		copyright = aDecoder.decodeObject(forKey: "copyright") as? String
		mediaMetadata = aDecoder.decodeObject(forKey: "media-metadata") as? [MediaMetadatum]
		subtype = aDecoder.decodeObject(forKey: "subtype") as? String
		type = aDecoder.decodeObject(forKey: "type") as? String
	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
	{
		if approvedForSyndication != nil{
			aCoder.encode(approvedForSyndication, forKey: "approved_for_syndication")
		}
		if caption != nil{
			aCoder.encode(caption, forKey: "caption")
		}
		if copyright != nil{
			aCoder.encode(copyright, forKey: "copyright")
		}
		if mediaMetadata != nil{
			aCoder.encode(mediaMetadata, forKey: "media-metadata")
		}
		if subtype != nil{
			aCoder.encode(subtype, forKey: "subtype")
		}
		if type != nil{
			aCoder.encode(type, forKey: "type")
		}

	}

}
