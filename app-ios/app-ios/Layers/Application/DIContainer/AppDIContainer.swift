//
//  AppDIContainer.swift
//  app-ios
//
//  Created by Lucas Mendonca de Albuquerque on 20/03/23.
//

import Foundation

final class AppDIContainer {
    
    lazy var appConfiguration = AppConfiguration()
    
    // MARK: - Network
    lazy var apiDataTransferService: DataTransferService = {
        let config = ApiDataNetworkConfig(
            baseURL: URL(string: appConfiguration.apiBaseURL)!
        )
        
        let apiDataNetwork = DefaultNetworkService(config: config)
        return DefaultDataTransferService(with: apiDataNetwork)
    }()
    
    // MARK: - DIContainers of scenes
    func makeSymbolsSceneDIContainer() -> SymbolsSceneDIContainer {
        let dependencies = SymbolsSceneDIContainer.Dependencies(
            apiDataTransferService: apiDataTransferService
        )
        return SymbolsSceneDIContainer(dependencies: dependencies)
    }
}
