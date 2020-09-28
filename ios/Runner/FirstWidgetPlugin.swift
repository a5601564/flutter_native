//
//  FirstWidgetPlugin.swift
//  Runner
//
//  Created by Phuoc on 9/28/20.
//

import Foundation

public class FirstWidgetPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let viewFactory = NativeViewFactory(messenger: registrar.messenger())
           registrar.register(viewFactory, withId: "plugins/first_widget")
    }
}
