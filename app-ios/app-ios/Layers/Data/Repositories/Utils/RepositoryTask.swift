//
//  RepositoryTask.swift
//  app-ios
//
//  Created by Lucas Mendonca de Albuquerque on 21/03/23.
//

import Foundation

class RepositoryTask: Cancellable {
    var networkTask: NetworkCancellable?
    var isCancelled: Bool = false
    
    func cancel() {
        networkTask?.cancel()
        isCancelled = true
    }
}
