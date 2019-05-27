//
//  NWConnectivity.swift
//  NewsApp
//
//  Created by Shimaa Samir on 5/25/19.
//  Copyright © 2019 Shimaa Samir. All rights reserved.
//

import Foundation
import Alamofire

class NWConnectivity: NSObject {
    
    static let sharedInstance = NWConnectivity()
    let networkManager = NetworkReachabilityManager()
    
    private override init() {
        
    }
    
    //check for internet connectivity
    func isConnectedToInternet() -> Bool {
        return networkManager!.isReachable
    }
    
    
    //start listening to internet connection to indicate when internet is connected
    func startListening(completion: @escaping ()-> ()) {
        networkManager?.listener = { status in
            if self.isConnectedToInternet() {
                self.networkManager?.stopListening()
                completion()
            }
            
        }
        
        networkManager?.startListening()
    }
    
    
}
