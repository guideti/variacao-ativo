//
//  HomeRequest.swift
//  variacao-ativa
//
//  Created by Raul Rodrigo on 12/03/23.
//

import Foundation

protocol HomeRequestProtocol {
    func getActives (sucessCallback: @escaping([ActiveModel]) -> Void, failureCallback: @escaping (Error?) -> Void)
}

class HomeRequest: HomeRequestProtocol {
    func getActives(sucessCallback: @escaping ([ActiveModel]) -> Void, failureCallback: @escaping (Error?) -> Void) {
        let decoder = JSONDecoder()
        do {
            let information = try decoder.decode(ActiveModelResponse.self, from: activeMock)
            sucessCallback(information.result)
        } catch {
            failureCallback(ResponseError(code: 999, message: "Erro ao decodificar") as? Error)
        }
    }
}


