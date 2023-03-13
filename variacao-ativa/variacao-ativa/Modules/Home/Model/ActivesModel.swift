//
//  ActivesModel.swift
//  variacao-ativa
//
//  Created by Raul Rodrigo on 12/03/23.
//

import Foundation

struct ActiveModelResponse: Codable {
    let result: [ActiveModel]
}

struct ActiveModel: Codable {
    let name: String
}
