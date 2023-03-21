//
//  Symbol.Entity.swift
//  app-ios
//
//  Created by Lucas Mendonca de Albuquerque on 20/03/23.
//

import Foundation

struct Symbol: Equatable, Identifiable {
    typealias Identifier = String
    
    let id: Identifier
    let longname: String?
    let symbol: String?
}

struct SymbolsPage: Equatable {
    let quotes: [Symbol]
}
