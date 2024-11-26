//
//  AppFlowCoordinator.swift
//  app-ios
//
//  Created by Lucas Mendonca de Albuquerque on 20/03/23.
//

import UIKit

final class AppFlowCoordinator {
    var navigationController: UINavigationController
    private let appDIContainer: AppDIContainer
    
    init(
        navigationController: UINavigationController,
        appDIContainer: AppDIContainer
    ) {
        self.navigationController = navigationController
        self.appDIContainer = appDIContainer
    }

    func start() {
        let symbolsSceneDIContainer = appDIContainer.makeSymbolsSceneDIContainer()
        let flow = symbolsSceneDIContainer.makeSymbolsSearchFlowCoordinator(navigationController: navigationController)
        flow.start()
    }
}
