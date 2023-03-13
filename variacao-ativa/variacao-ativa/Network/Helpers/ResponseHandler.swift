//
//  ResponseHandler.swift
//  Star Wars
//
//  Created by Gabriel Aragao on 02/07/22.
//

import Foundation

class ResponseHandler {
    let data: Data?
    let urlResponse: HTTPURLResponse?
    let error: Error?
    var errorMessage: ErrorMessage?
    required init(with data: Data?, urlResponse: HTTPURLResponse?, error: Error?) {
        
        self.data = data
        self.urlResponse = urlResponse
        self.error = error
        if let responseData = self.data {
            self.errorMessage = try? JSONDecoder().decode(ErrorMessage.self, from: responseData)
        }
        try? parseModel()
    }
    func success() -> Bool {
        return (urlResponse?.statusCode == 200) ? true : false
    }
    func responseError() -> ResponseError {
        
        if !NetworkStatus.shared.isInternetAvailable() {
            return ResponseError(code: -25, message: ReferencesString.noConnection)
        }
        
        guard let urlResponse = urlResponse else {
            if let error = error {
                let code = (error as NSError).code
                return ResponseError(code: code, message: error.localizedDescription)
            }
            return ResponseError(code: -1, message: ReferencesString.genericError)
        }
        
        return ResponseError(code: urlResponse.statusCode, message: HTTPURLResponse.localizedString(forStatusCode: urlResponse.statusCode))
    }
    
    func parseModel() throws {
        preconditionFailure("This method must be overridden")
    }
}

struct ResponseError{
    let code: Int!
    let message: String!
    
    init(code: Int, message: String){
        self.code = code
        self.message = message
    }
}

class ErrorMessage: Codable{
    var message: String?
    
    enum CodingKeys: String, CodingKey{
        case message = "error"
    }
}
