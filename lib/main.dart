import 'package:flutter/material.dart';

import 'first.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FirstWidgetController controller;

  Map curveMap = {
    "x0": 0 / 611,
    "y0": 165 / 165,
    "x1": 165 / 611,
    "y1": 69 / 165,
    "x2": 501 / 611,
    "y2": 69 / 165,
    "x3": 611 / 611,
    "y3": 165 / 165,
  };
  double fontSize = 40;

  setType(FirstWidgetController controller, String type) {
    controller.setType(type);
    controller.setFontSize(70);
    controller.setText("Carddddddddd");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('aaa')),
      body: Container(
        width: double.infinity,
        height: 2000,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.jpg"),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Stack(children: [
          Positioned(
            top: 240,
            left: 85,
            child: Card(
              color: Colors.transparent.withOpacity(0.5),
              child: SizedBox(
                height: 60,
                width: 222,
                child: FirstWidget(
                  onFirstWidgetWidgetCreated: (c) async {
                    this.controller = c;
                    var ping_result = await controller.ping();
                    print(ping_result);
                    var setType_result = await controller.setType("spell");
                    var setCurve = await controller.setCurve(curveMap);
                    var setFont_result = await controller.setFontSize(50);
                    var setText_result =
                        await controller.setText('Card card name on flutter');
                  },
                ),
              ),
            ),
          ),
          Positioned(
            top: 500,
            left: 10,
            child: Container(
              color: Colors.red,
              child: FlatButton(
                child: Text('click'),
                onPressed: () {
                  print("x0: " +
                      curveMap["x0"].toString() +
                      "\n" +
                      "y0: " +
                      curveMap["y0"].toString() +
                      "\n" +
                      "x1: " +
                      curveMap["x1"].toString() +
                      "\n" +
                      "y1: " +
                      curveMap["y1"].toString() +
                      "\n" +
                      "x2: " +
                      curveMap["x2"].toString() +
                      "\n" +
                      "y2: " +
                      curveMap["y2"].toString() +
                      "\n" +
                      "x3: " +
                      curveMap["x3"].toString() +
                      "\n" +
                      "y3: " +
                      curveMap["y3"].toString() +
                      "\n");
                },
              ),
            ),
          ),
          Positioned(
            top: 500,
            left: 100,
            child: Container(
              color: Colors.red,
              child: FlatButton(
                child: Text('click'),
                onPressed: () {
                  curveMap = {
                    "x0": 0,
                    "y0": 125 / 165,
                    "x1": 90 / 611,
                    "y1": 170 / 165,
                    "x2": (585 - 133) / 611,
                    "y2": -5 / 165,
                    "x3": 611 / 611,
                    "y3": 125 / 165,
                  };
                  controller.setCurve(curveMap);
                  controller.setFontSize(29);
                  controller.setType("hero");
                  controller.setText('Card name after click');
                  print("clicked");
                  setState(() {});
                },
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 1,
            child: Column(
              children: [
                Row(
                  children: [
                    Text('x0'),
                    Container(
                      child: Slider(
                        value: curveMap["x0"].toDouble(),
                        min: -1.0,
                        max: 2.0,
                        onChanged: (value) async {
                          curveMap["x0"] = value.toDouble();
                          var setCurve = await controller.setCurve(curveMap);
                          setState(() {});
                        },
                      ),
                    ),
                    Container(
                      child: Slider(
                        value: curveMap["y0"].toDouble(),
                        min: -1.0,
                        max: 2.0,
                        onChanged: (value) async {
                          curveMap["y0"] = value.toDouble();
                          var setCurve = await controller.setCurve(curveMap);
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('x1'),
                    Container(
                      child: Slider(
                        value: curveMap["x1"].toDouble(),
                        min: -1.0,
                        max: 2.0,
                        onChanged: (value) async {
                          curveMap["x1"] = value.toDouble();
                          var setCurve = await controller.setCurve(curveMap);
                          setState(() {});
                        },
                      ),
                    ),
                    Container(
                      child: Slider(
                        value: curveMap["y1"].toDouble(),
                        min: -1.0,
                        max: 2.0,
                        onChanged: (value) async {
                          curveMap["y1"] = value.toDouble();
                          var setCurve = await controller.setCurve(curveMap);
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('x2'),
                    Container(
                      child: Slider(
                        value: curveMap["x2"].toDouble(),
                        min: -1.0,
                        max: 2.0,
                        onChanged: (value) async {
                          curveMap["x2"] = value.toDouble();
                          var setCurve = await controller.setCurve(curveMap);
                          setState(() {});
                        },
                      ),
                    ),
                    Container(
                      child: Slider(
                        value: curveMap["y2"].toDouble(),
                        min: -1.0,
                        max: 2.0,
                        onChanged: (value) async {
                          curveMap["y2"] = value.toDouble();
                          var setCurve = await controller.setCurve(curveMap);
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('x3'),
                    Container(
                      child: Slider(
                        value: curveMap["x3"].toDouble(),
                        min: -1.0,
                        max: 2.0,
                        onChanged: (value) async {
                          curveMap["x3"] = value.toDouble();
                          var setCurve = await controller.setCurve(curveMap);
                          setState(() {});
                        },
                      ),
                    ),
                    Container(
                      child: Slider(
                        value: curveMap["y3"].toDouble(),
                        min: -1.0,
                        max: 2.0,
                        onChanged: (value) async {
                          curveMap["y3"] = value.toDouble();
                          var setCurve = await controller.setCurve(curveMap);
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('font'),
                    Container(
                      child: Slider(
                        value: fontSize,
                        min: 10.0,
                        max: 100.0,
                        onChanged: (value) async {
                          fontSize = value.toDouble();
                          var set = await controller.setFontSize(fontSize);
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
