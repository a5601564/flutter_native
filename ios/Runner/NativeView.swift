//
//  NativeView.swift
//  Runner
//
//  Created by Phuoc on 10/1/20.
//

import Foundation
public class NativeView : NSObject, FlutterPlatformView {
    
    let frame : CGRect
    let viewId : Int64
    
    static var myView  = MyView()

    
    init(_ frame:CGRect,messenger: FlutterBinaryMessenger, viewId:Int64, args: Any?){
        self.frame = frame
        self.viewId = viewId
        NativeView.myView.frame = frame
        let channel = FlutterMethodChannel(name: "plugins/first_widget_\(viewId)",
                                              binaryMessenger: messenger)
       channel.setMethodCallHandler({ (call: FlutterMethodCall, result: FlutterResult) -> Void in
        switch call.method {
         case "ping":
            result("ping success")
        case "setType":
           // NativeView.setCurvedTextType(text: "aaa")
            result("setType success")
        case "setFont":
            result(nil)
        case "setSize":
            result("setType success")
        case "setText":
            print("ios:", (call.arguments) as! String)
            NativeView.setCurvedTextType(text: (call.arguments) as! String)
            result("setType success")
         default:
            result(FlutterMethodNotImplemented)
         }
    
       })
    }
    
    static func setCurvedTextType(text: String){
         
             print("print minion aaa");
            
        myView.setTextOnPath(text: text, textSize: 30)
        NativeView.myView.layoutIfNeeded()
        print("text ", text)
        
     }
    
    public func view() -> UIView {
        NativeView.myView.backgroundColor = UIColor.blue.withAlphaComponent(0.3)
//        self.view.addSubview(label)
        NativeView.myView.layoutIfNeeded()
        return NativeView.myView
    }
    
  

}
