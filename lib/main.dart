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
        primarySwatch: Colors.blue,
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  FirstWidgetController controller;

  setType(FirstWidgetController controller, String type) {
    controller.setType(type);
    // controller.setFont(50);
    controller.setText("Carddddddddd");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              child: SizedBox(
                height: 60,
                width: 222,
                child: FirstWidget(
                  onFirstWidgetWidgetCreated: (c) async {
                    this.controller = c;
                    var ping_result = await controller.ping();
                    print(ping_result);
                    var setType_result = await controller.setType("minion");
                    // var setFont_result = await controller.setFont(50);
                    // var setText_resule =
                    //     await controller.setText('Card nameeee');
                  },
                ),
              ),
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Row(
              children: [
                FlatButton(
                  onPressed: () {
                    setType(controller, "minion");
                    print('flutter minion');
                  },
                  child: Text('Minion'),
                ),
                FlatButton(
                  onPressed: () {
                    setType(controller, "spell");
                    print('flutter spell');
                  },
                  child: Text('Spell'),
                ),
                FlatButton(
                  onPressed: () {
                    setType(controller, "hero");
                    print('flutter hero');
                  },
                  child: Text('Hero'),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
