//
//  RequestHandler.swift
//  Star Wars
//
//  Created by Gabriel Aragao on 02/07/22.
//

import Foundation
import Alamofire

class RequestHandler {
    
    init(path: String, httpMethod: String, headers: [String:Any]?, parameters: [String:Any]?, encoding: String?) {
        self.path = path
        self.encoding = encoding?.stringToEncodingStrategy ?? .JSON
        self.parameters = parameters
        self.headers = ["Content-Type": "application/json"] as HTTPHeaders
        self.httpMethod = httpMethod.stringToHttpMethod
    }
    
    let path: String
    
    let httpMethod: HTTPMethod
    
    let headers: HTTPHeaders?
    
    let parameters:[String: Any]?
    
    let encoding: EncodingStrategy
}

extension String {
    var stringToEncodingStrategy: EncodingStrategy {
        switch self {
            
        case "URL":
            return .URL
        default:
            return .JSON
        }
    }
    var stringToHttpMethod: HTTPMethod {
        switch self {
            
        case "POST":
            return .post
        case "PUT":
            return .put
        case "DELETE":
            return .delete
        default:
            return .get
        }
    }
}


enum EncodingStrategy {
    case JSON
    case URL
}

extension EncodingStrategy {
    var alamofireEncoding: ParameterEncoding {
        switch self {
        case .JSON:  return JSONEncoding()
        case .URL: return URLEncoding(boolEncoding: .literal)
        }
    }
}

