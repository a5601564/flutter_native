//
//  NativeViewFactory.swift
//  Runner
//
//  Created by Phuoc on 9/28/20.
//

import Foundation

class NativeViewFactory : NSObject, FlutterPlatformViewFactory {
    let messenger: FlutterBinaryMessenger
    
    init(messenger: FlutterBinaryMessenger){
        self.messenger = messenger;
    }
    
    public func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        return NativeView(frame,messenger: messenger, viewId:viewId, args:args)
    }
}


public class NativeView : NSObject, FlutterPlatformView {
    
    let frame : CGRect
    let viewId : Int64
    
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
            result("setType success")
         default:
            result(FlutterMethodNotImplemented)
         }
    
       })
    }
    
    public func view() -> UIView {
        let view  = MyView2(frame: self.frame)
        

       
//        self.view.addSubview(label)
        return view
    }

}
