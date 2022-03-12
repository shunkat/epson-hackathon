import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:printer_connect/Registration.dart';
import 'package:printer_connect/url_launch.dart';
import 'package:flutter/rendering.dart';
import 'package:printer_connect/url_launch.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // fontFamily: "Noto Sans JP",
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Row(
            children: <Widget>[
              SizedBox(
                width: 250, //横幅
                height: 300, //高さ
                child: ElevatedButton(
                  child: Text("EpsonConncect未登録の方\n最初はこちら"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Registration(),
                        ));
                  },
                ),
              ),
              SizedBox(
                width: 250, //横幅
                height: 300, //高さ
                child: ElevatedButton(
                  child: Text(
                    "EpsonConncect登録済みの方",
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Registration(),
                        ));
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
