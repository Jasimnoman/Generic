//
//  NetworkManager.swift
//  JUST CHILL
//
//  Created by khawer Nisar on 11/12/18.
//  Copyright © 2018 Rehan Saleem. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import MBProgressHUD

class NetworkManager: NSObject {
    
    static let sharedInstance = NetworkManager()
    
    func sendGetRequest(url: String, completion: @escaping (AFDataResponse<String>) -> Void) -> Void {
        
        if !Reachability.isConnectedToNetwork() {
            AlertControllerHelper.showAlertWithAction(message: "Your internet connection smeed to be offline") { (success) in
                if let topVC = UIApplication.topViewController() {
                    MBProgressHUD.hide(for: topVC.view, animated: true)
                }
            }
            
            return
        }
        let api = "\(Constants.BaseUrl)\(url)"
        print(api)
        let headers : HTTPHeaders = [
            "Content-Type" : Constants.contentType,
        ]
        print(headers)
        
        AF.request(api, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers, interceptor: nil).responseString { (response) in
            completion(response)
        }
    }
    
}
