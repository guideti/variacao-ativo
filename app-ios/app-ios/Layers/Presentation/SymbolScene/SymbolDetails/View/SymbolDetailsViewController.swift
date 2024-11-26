//
//  SymbolDetailsViewController.swift
//  app-ios
//
//  Created by Lucas Mendonca de Albuquerque on 21/03/23.
//

import Flutter
import FlutterPluginRegistrant
import UIKit

final class SymbolDetailsViewController: FlutterViewController, StoryboardInstantiable {
    private var channel: FlutterMethodChannel?
    
    // MARK: - Lifecycle
    private var viewModel: SymbolDetailsViewModel!
    
    static func create(with viewModel: SymbolDetailsViewModel, withEntrypoint entryPoint: String?) -> SymbolDetailsViewController {
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let newEngine = appDelegate.engines.makeEngine(withEntrypoint: entryPoint, libraryURI: nil)
        GeneratedPluginRegistrant.register(with: newEngine)
        
        let view = SymbolDetailsViewController.instantiateViewController()
        view.viewModel = viewModel
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    // MARK: - Private
    private func setupViews() {
        channel = FlutterMethodChannel(name: "app-flutter-engine", binaryMessenger: self.engine!.binaryMessenger)
        
        if let channel = channel {
          channel.invokeMethod("setActive", arguments: viewModel.code)
        }
        
        title = "\(viewModel.title) (\(viewModel.code))"
        view.accessibilityIdentifier = AccessibilityIdentifier.symbolDetailsView
    }
}
