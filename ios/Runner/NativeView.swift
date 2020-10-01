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
    var font: Double = 20
    var text: String = "Card name ios"
    var type: String = "minion"
    var size = [
        "x0" : 0,
        "y0" : 125/165
    ]
    
    init(_ frame:CGRect,messenger: FlutterBinaryMessenger, viewId:Int64, args: Any?){
        self.frame = frame
        self.viewId = viewId
        
        let channel = FlutterMethodChannel(name: "plugins/first_widget_\(viewId)",
                                              binaryMessenger: messenger)
       channel.setMethodCallHandler({ (call: FlutterMethodCall, result: FlutterResult) -> Void in
        switch call.method {
         case "ping":
            result("ping success")
        case "setType":
            NativeView.setCurvedTextType(type: "minion")
            result("setType success")
        case "setFont":
            result(nil)
        case "setSize":
            result("setType success")
        case "setText":
            result("setType success")
         default:
            result(FlutterMethodNotImplemented)
         }
    
       })
    }
    
    static func setCurvedTextType(type: String){
         if(type.elementsEqual("minion") == true){
             print("print minion aaa");
         }
     }
    
    public func view() -> UIView {
        let view  = MyView(frame: self.frame)
        view.backgroundColor = UIColor.blue.withAlphaComponent(0.3)
//        self.view.addSubview(label)
        return view
    }
    
  

}
