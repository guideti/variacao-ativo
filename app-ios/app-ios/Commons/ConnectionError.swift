//
//  ConnectionError.swift
//  app-ios
//
//  Created by Lucas Mendonca de Albuquerque on 20/03/23.
//

import Foundation

protocol ConnectionError: Error {
    var isInternetConnectionError: Bool { get }
}

extension Error {
    var isInternetConnectionError: Bool {
        guard let error = self as? ConnectionError, error.isInternetConnectionError else {
            return false
        }
        return true
    }
}
