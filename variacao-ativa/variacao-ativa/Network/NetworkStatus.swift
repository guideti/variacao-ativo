//
//  NetworkStatus.swift
//  Star Wars
//
//  Created by Gabriel Aragao on 02/07/22.
//

import Foundation
import Alamofire
class NetworkStatus{
    static let shared = NetworkStatus()
    var networkManager: NetworkReachabilityManager?
    init(){
        self.networkManager = NetworkReachabilityManager()
    }
    
    func isInternetAvailable() -> Bool {
        guard let manager = self.networkManager else {
            return false
        }
        return manager.isReachable
    }
    
}
