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


