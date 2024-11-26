//
//  UseCase.swift
//  app-ios
//
//  Created by Lucas Mendonca de Albuquerque on 20/03/23.
//

import Foundation

protocol UseCase {
    @discardableResult
    func start() -> Cancellable?
}
