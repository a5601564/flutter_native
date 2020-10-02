import 'dart:async';
import 'dart:ffi';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef FirstWidgetCreatedCallback = void Function(
    FirstWidgetController controller);

class FirstWidget extends StatefulWidget {
  const FirstWidget({
    Key key,
    this.onFirstWidgetWidgetCreated,
  }) : super(key: key);

  final FirstWidgetCreatedCallback onFirstWidgetWidgetCreated;

  @override
  State<StatefulWidget> createState() => _FirstWidgetState();
}

class _FirstWidgetState extends State<FirstWidget> {
  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(
        viewType: 'plugins/first_widget',
        onPlatformViewCreated: _onPlatformViewCreated,
        creationParamsCodec: const StandardMessageCodec(),
      );
    }
    return UiKitView(
      viewType: 'plugins/first_widget',
      onPlatformViewCreated: _onPlatformViewCreated,
      creationParamsCodec: const StandardMessageCodec(),
    );
  }

  void _onPlatformViewCreated(int id) {
    if (widget.onFirstWidgetWidgetCreated == null) {
      return;
    }
    widget.onFirstWidgetWidgetCreated(FirstWidgetController._(id));
  }
}

class FirstWidgetController {
  FirstWidgetController._(int id)
      : _channel = MethodChannel('plugins/first_widget_$id');

  final MethodChannel _channel;

  Future<String> ping() async {
    return _channel.invokeMethod('ping');
  }

  Future<String> setType(String type) async {
    return _channel.invokeMethod('setType', type);
  }

  Future<double> setFontSize(double font) async {
    return _channel.invokeMethod('setFontSize', font);
  }

  Future<String> setCurve(Map curve) {
    return _channel.invokeMethod('setCurve', curve);
  }

  Future<String> setText(String text) async {
    return _channel.invokeMethod('setText', text);
  }
}
