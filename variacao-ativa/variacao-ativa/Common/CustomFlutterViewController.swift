//
//  CustomFlutterViewController.swift
//  variacao-ativa
//
//  Created by Raul Rodrigo on 12/03/23.
//

import Flutter

class CustomFlutterViewController: FlutterViewController {
    var param: String!
    var flutterChannel: FlutterMethodChannel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        flutterChannel = FlutterMethodChannel(name: "com.raul.variacaoativa", binaryMessenger: self.binaryMessenger)
        
        flutterChannel.setMethodCallHandler ({ [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
            
            switch call.method {
            case "getActiveName":
                result(self?.param)
            case "exitFlutter":
                self?.exitFlutter()
            default:
                result(FlutterMethodNotImplemented)
            }
        })
    }
    
    private func exitFlutter() {
        self.dismiss(animated: true)
    }
}
