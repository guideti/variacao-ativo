//
//  AppDelegate.swift
//  variacao-ativa
//
//  Created by Raul Rodrigo on 12/03/23.
//

import UIKit
import Flutter
import FlutterPluginRegistrant

@UIApplicationMain
class AppDelegate: FlutterAppDelegate {
    
    lazy var flutterEngine = FlutterEngine(name: "flutter engine")
    
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        flutterEngine.run()
        GeneratedPluginRegistrant.register(with: self.flutterEngine)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
