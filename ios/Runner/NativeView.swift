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
    
    var myView  = MyView()
    var size = [
            "x0" : 1/4,
            "y0" : 125/165
        ]
    
    init(_ frame:CGRect,messenger: FlutterBinaryMessenger, viewId:Int64, args: Any?){
        self.frame = frame
        self.viewId = viewId
        myView.frame = frame
        super.init()
        
        let channel = FlutterMethodChannel(name: "plugins/first_widget_\(viewId)",
                                              binaryMessenger: messenger)
        channel.setMethodCallHandler({ [self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
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
            setCurvedTextType(text: (call.arguments) as! String, size: size)
            result("setType success")
         default:
            result(FlutterMethodNotImplemented)
         }
    
       })
    }
    
    func setCurvedTextType(text: String, size:[String: Int]){
        myView.setTextOnPath(text: text, textSize: 30)
        myView.setNeedsDisplay()
        print("text ", text)
     }
    
    public func view() -> UIView {
        myView.backgroundColor = UIColor.blue.withAlphaComponent(0.3)
//        self.view.addSubview(label)
        myView.setNeedsDisplay()
        return myView
    }
    
  
}

