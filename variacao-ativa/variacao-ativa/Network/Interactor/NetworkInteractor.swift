//
//  NetworkInteractor.swift
//  Star Wars
//
//  Created by Gabriel Aragao on 02/07/22.
//

import Foundation

enum NetworkResponseType{
    case none
    case getCharacterList
}

protocol NetworkInteractorProtocols{
    func check(_ ID: NetworkResponseType)
}

protocol NetworkInteractorResponse{
    func networkAvailable(_ ID: NetworkResponseType)
    func networkNotAvailable(_ ID: NetworkResponseType)
}

class NetworkInteractor{
    var response: NetworkInteractorResponse?
}

extension NetworkInteractor {
    func check(_ ID: NetworkResponseType = .none) {
        if NetworkStatus.shared.isInternetAvailable(){
            response?.networkAvailable(ID)
        } else {
            response?.networkNotAvailable(ID)
        }
    }
}
