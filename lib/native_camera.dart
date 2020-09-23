import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NativeCamera extends StatefulWidget {
  @override
  _NativeCameraState createState() => _NativeCameraState();
}

class _NativeCameraState extends State<NativeCamera> {
  static const platformMethodChannel =
      const MethodChannel('com.example.native_test/native');
  String nativeMessage = '';

  Future<Null> _launchCamera() async {
    String _message;
    try {
      final String result =
          await platformMethodChannel.invokeMethod('takePhoto');
      _message = result;
    } on PlatformException catch (e) {
      _message = "Can't do native stuff ${e.message}.";
    }
    setState(() {
      nativeMessage = _message;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 102.0),
            child: Center(
              child: FlatButton.icon(
                icon: Icon(
                  Icons.photo_camera,
                  size: 100,
                ),
                label: Text(''),
                textColor: Colors.white,
                onPressed: _launchCamera,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 102.0),
            child: Center(
              child: Text(
                nativeMessage,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 23.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
