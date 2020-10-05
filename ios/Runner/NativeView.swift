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
    var fontSize: CGFloat = 20
    var text: String = "Default Card name"
    var type: String = "minion"
    
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
            type = (call.arguments) as! String
            print(type)
            setCurvedTextType(text: text,type: type ,fontsize: fontSize)
            result("setType success")
            
        case "setFontSize":
            fontSize = (call.arguments) as! CGFloat
            print("font size from flutter: ",fontSize)
            setCurvedTextType(text: text,type: type ,fontsize: fontSize)
            result(nil)
            
        case "setCurve":
            result("setType success")
            
        case "setText":
            print("ios:", (call.arguments) as! String)
            text = (call.arguments) as! String
            setCurvedTextType(text: text,type: type ,fontsize: fontSize)
            result("setType success")
            
         default:
            result(FlutterMethodNotImplemented)
         }
    
       })
    }
    
    func setCurvedTextType(text: String, type: String, fontsize: CGFloat){
        myView.setTextOnPath(text: text, type: type, textSize: fontSize)
        myView.setNeedsDisplay()
        print("fontsize ", fontsize)
     }
    
    public func view() -> UIView {
        myView.backgroundColor = UIColor.blue.withAlphaComponent(0.3)
//        self.view.addSubview(label)
        myView.setNeedsDisplay()
        return myView
    }
    
  
}

