//
//  NetworkManager.swift
//  Star Wars
//
//  Created by Gabriel Aragao on 02/07/22.
//

import Foundation
import Alamofire

class NetworkManager: Decodable {
    
    static let sharedInstance = NetworkManager()
    
    private lazy var manager: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        let manager = Alamofire.Session(configuration: configuration)
        return manager
    }()
    
    func request(path: String, method: String, parameters: [String:Any]?, encoding: String?, headers: [String: Any]?, completion: @escaping (ResponseHandler) -> Void) {
            
            let requestHandler = RequestHandler(path: path, httpMethod: method, headers: headers, parameters: parameters, encoding: encoding)
            
        manager.request(requestHandler.path,
                        method: requestHandler.httpMethod,
                        parameters: requestHandler.parameters,
                        encoding: requestHandler.encoding.alamofireEncoding,
                        headers: requestHandler.headers).validate()
                .responseJSON { (json: AFDataResponse<Any>) in
                    
                    let urlResponse = json.response
                    let responseObject: ResponseHandler = ResponseHandler(with: json.data, urlResponse: urlResponse, error: json.error)
                    completion(responseObject)
                }
        }
}
