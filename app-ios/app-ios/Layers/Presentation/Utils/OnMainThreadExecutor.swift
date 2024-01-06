//
//  OnMainThreadExecutor.swift
//  app-ios
//
//  Created by Lucas Mendonca de Albuquerque on 21/03/23.
//

import Foundation

protocol OnMainThreadExecutor {
    func execute(block: @escaping () -> Void)
}

final class DefaultOnMainThreadExecutor: OnMainThreadExecutor {
    let mainQueue: DispatchQueue = .main
    func execute(block: @escaping () -> Void) {
        if Thread.isMainThread {
            block()
        } else {
            mainQueue.async {
                block()
            }
        }
    }
}

