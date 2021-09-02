//
//  ServicesManager.swift
//  CCO-iOS
//
//  Created by Jahan on 6/6/20.
//  Copyright © 2020 Jahan. All rights reserved.
//

import UIKit
import Alamofire

extension NetworkManager {
    
    func getMostViewedList(completion: @escaping (AFDataResponse<String>) -> Void) {
        sendGetRequest(url: "\(Constants.EndPonts.mostViewed)\(Constants.days).json?api-key=\(Constants.apiKey)" , completion: completion)
    }
    
}
