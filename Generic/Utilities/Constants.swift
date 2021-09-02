//
//  Constants.swift
//  Tag Team Tales
//
//  Created by Macbook on 10/03/2020.
//  Copyright © 2020 Arslan. All rights reserved.
//

import UIKit

struct Constants {
    
    static let BaseUrl = "http://api.nytimes.com/svc/mostpopular/v2/"
    static let deviceType = "ios"
    static let contentType = "application/json"
    static var tokenType = "Bearer"
    static let deviceId = NSUUID().uuidString
    static let directoryName : String = "com.Jasim.Generic"
    static let apiKey = "5A6Vmip27BL5PIcGgsp1PGv2hQ6qGR6y"
    static let apiSecret = "GVCIJDlFOrJEnPZK"
    static let appId = "b79af218-f531-427b-8c2d-c1b1ece3da1a"
    static let days = 7
    
    static var userId: String {
        get {
            return UserDefaults.standard.string(forKey: "userId") ?? ""
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "userId")
            UserDefaults.standard.synchronize()
        }
    }
    
    struct Storyboards {
        static let Main = UIStoryboard(name: "Main", bundle: nil)
    }
    
    struct Colors {
        static let textColor = #colorLiteral(red: 0.9921568627, green: 0.4, blue: 0, alpha: 1)
    }
    
    struct EndPonts {
        static let mostViewed = "viewed/"
    }
    
    struct TableViewCells {
        static let MostViewedTVCell = "MostViewedTVCell"
    }
    
    //
    struct ViewControllers {
        static let MostViewedVC = "MostViewedVC"
    }

}
