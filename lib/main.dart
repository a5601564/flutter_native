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

  Map sizeMap = {
    "x0": 0,
    "y0": 125 / 165,
    "x1": 90 / 611,
    "y1": 170 / 165,
    "x2": (585 - 133) / 611,
    "y2": 15 / 165,
    "x3": 611 / 611,
    "y3": 125 / 165,
  };

  setType(FirstWidgetController controller, String type) {
    controller.setType(type);
    controller.setFont(70);
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
            top: 305,
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
                    var setType_result = await controller.setType("minion");
                    var setSize = await controller.setSize(sizeMap);
                    // var setFont_result = await controller.setFont(50);
                    var setText_resule =
                        await controller.setText('Card nameeee');
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
                      sizeMap["x0"].toString() +
                      "\n" +
                      "y0: " +
                      sizeMap["y0"].toString() +
                      "\n" +
                      "x1: " +
                      sizeMap["x1"].toString() +
                      "\n" +
                      "y1: " +
                      sizeMap["y1"].toString() +
                      "\n" +
                      "x2: " +
                      sizeMap["x2"].toString() +
                      "\n" +
                      "y2: " +
                      sizeMap["y2"].toString() +
                      "\n" +
                      "x3: " +
                      sizeMap["x3"].toString() +
                      "\n" +
                      "y3: " +
                      sizeMap["y3"].toString() +
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
                  sizeMap = {
                    "x0": 0,
                    "y0": 125 / 165,
                    "x1": 90 / 611,
                    "y1": 170 / 165,
                    "x2": (585 - 133) / 611,
                    "y2": -5 / 165,
                    "x3": 611 / 611,
                    "y3": 125 / 165,
                  };
                  controller.setSize(sizeMap);
                  controller.setText('Card nameeeeaadasds');
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
                        value: sizeMap["x0"].toDouble(),
                        min: -1.0,
                        max: 2.0,
                        onChanged: (value) async {
                          sizeMap["x0"] = value.toDouble();
                          var setSize = await controller.setSize(sizeMap);
                          setState(() {});
                        },
                      ),
                    ),
                    Container(
                      child: Slider(
                        value: sizeMap["y0"].toDouble(),
                        min: -1.0,
                        max: 2.0,
                        onChanged: (value) async {
                          sizeMap["y0"] = value.toDouble();
                          var setSize = await controller.setSize(sizeMap);
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
                        value: sizeMap["x1"].toDouble(),
                        min: -1.0,
                        max: 2.0,
                        onChanged: (value) async {
                          sizeMap["x1"] = value.toDouble();
                          var setSize = await controller.setSize(sizeMap);
                          setState(() {});
                        },
                      ),
                    ),
                    Container(
                      child: Slider(
                        value: sizeMap["y1"].toDouble(),
                        min: -1.0,
                        max: 2.0,
                        onChanged: (value) async {
                          sizeMap["y1"] = value.toDouble();
                          var setSize = await controller.setSize(sizeMap);
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
                        value: sizeMap["x2"].toDouble(),
                        min: -1.0,
                        max: 2.0,
                        onChanged: (value) async {
                          sizeMap["x2"] = value.toDouble();
                          var setSize = await controller.setSize(sizeMap);
                          setState(() {});
                        },
                      ),
                    ),
                    Container(
                      child: Slider(
                        value: sizeMap["y2"].toDouble(),
                        min: -1.0,
                        max: 2.0,
                        onChanged: (value) async {
                          sizeMap["y2"] = value.toDouble();
                          var setSize = await controller.setSize(sizeMap);
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
                        value: sizeMap["x3"].toDouble(),
                        min: -1.0,
                        max: 2.0,
                        onChanged: (value) async {
                          sizeMap["x3"] = value.toDouble();
                          var setSize = await controller.setSize(sizeMap);
                          setState(() {});
                        },
                      ),
                    ),
                    Container(
                      child: Slider(
                        value: sizeMap["y3"].toDouble(),
                        min: -1.0,
                        max: 2.0,
                        onChanged: (value) async {
                          sizeMap["y3"] = value.toDouble();
                          var setSize = await controller.setSize(sizeMap);
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
