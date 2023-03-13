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
    
    private func getDataFromApi(args: Dictionary<String,Any>, flutterResult: FlutterResult) {
        var data: Data?
       if let path = args["path"] as? String, let method = args["method"] as? String, let parameters = args["parameters"] as? [String:Any]?, let encoding = args["encoding"] as? String?, let headers = args["headers"] as? [String:Any]? {
           NetworkManager.sharedInstance.request(path: path, method: method, parameters: parameters, encoding: encoding, headers: headers) { result in
               data = result.data
           }
           flutterResult(data)
       } else {
           flutterResult(["Error": "Falta parâmetros/parâmetros incorretos"])
       }
    }
    
    private func exitFlutter() {
        self.dismiss(animated: true)
    }
}
