//
//  MediaMetadatum.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on September 2, 2021

import Foundation
import SwiftyJSON


class MediaMetadatum : NSObject, NSCoding{

    var format : String!
    var height : Int!
    var url : String!
    var width : Int!

	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
        format = json["format"].stringValue
        height = json["height"].intValue
        url = json["url"].stringValue
        width = json["width"].intValue
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
        if format != nil{
        	dictionary["format"] = format
        }
        if height != nil{
        	dictionary["height"] = height
        }
        if url != nil{
        	dictionary["url"] = url
        }
        if width != nil{
        	dictionary["width"] = width
        }
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
		format = aDecoder.decodeObject(forKey: "format") as? String
		height = aDecoder.decodeObject(forKey: "height") as? Int
		url = aDecoder.decodeObject(forKey: "url") as? String
		width = aDecoder.decodeObject(forKey: "width") as? Int
	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
	{
		if format != nil{
			aCoder.encode(format, forKey: "format")
		}
		if height != nil{
			aCoder.encode(height, forKey: "height")
		}
		if url != nil{
			aCoder.encode(url, forKey: "url")
		}
		if width != nil{
			aCoder.encode(width, forKey: "width")
		}

	}

}
