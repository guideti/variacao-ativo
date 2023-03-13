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
        
        flutterChannel.setMethodCallHandler ({ [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            switch call.method {
            case "getActiveName":
                result(self?.param)
            case "getDataFromApi":
                if let args = call.arguments as? Dictionary<String,Any> {
                    self?.getDataFromApi(args: args, flutterResult: result)
                } else {
                    result(["Error": "Falta parâmetros"])
                }
                
            case "exitFlutter":
                self?.exitFlutter()
            default:
                result(FlutterMethodNotImplemented)
            }
        })
    }
    
    private func getDataFromApi(args: Dictionary<String,Any>, flutterResult: @escaping FlutterResult) {
        if let path = args["path"] as? String, let method = args["method"] as? String {
            
            NetworkManager.sharedInstance.request(path: path, method: method, parameters: nil, encoding: nil, headers: nil) { result in
                
                do {
                    let data = try JSONSerialization.jsonObject(with: result.data!) as? [String: Any]
                    flutterResult(["data": data as [String: Any]?, "statusCode": (result.urlResponse?.statusCode ?? 999) as Int, "errorMessage": result.errorMessage?.message as String?])
                } catch {
                    flutterResult(["Error": "bad error"])
                } 
            }
        } else {
            flutterResult(["Error": "Falta parâmetros/parâmetros incorretos"])
        }
    }
    
    private func exitFlutter() {
        self.dismiss(animated: true)
    }
}
