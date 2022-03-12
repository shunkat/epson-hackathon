import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:printer_connect/Registration.dart';
import 'package:printer_connect/url_launch.dart';
import 'package:printer_connect/SendData.dart';
import 'package:flutter/rendering.dart';
import 'package:printer_connect/url_launch.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  // Fireabse初期化
  // debugPaintSizeEnabled = true;
  await Firebase.initializeApp();
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
          return Center(
            child: Column(
              children: <Widget>[
                Container(
                  width: 230, //横幅
                  height: 100, //高さ
                  margin: EdgeInsets.only(
                      top: 170, bottom: 30, right: 30, left: 30),
                  decoration: BoxDecoration(
                    // 枠線の装飾、背景色などの指定
                    border:
                        Border.all(color: Colors.black, width: 5), //　枠線の色と太さを指定
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 3.0,
                        spreadRadius: 1.0,
                        offset: Offset(5, 5),
                      ),
                    ],
                    color: Colors.yellow[200], // 内部の色を指定
                  ), // 内部の色を指定,
                  child: ElevatedButton(
                    child: Text(
                      "EpsonConncect未登録の方\n最初はこちら",
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Registration(),
                          ));
                    },
                  ),
                ),
                Container(
                  width: 230, //横幅
                  height: 100, //高さ
                  margin:
                      EdgeInsets.only(top: 60, bottom: 30, right: 30, left: 30),
                  decoration: BoxDecoration(
                    // 枠線の装飾、背景色などの指定
                    border:
                        Border.all(color: Colors.black, width: 5), //　枠線の色と太さを指定
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 3.0,
                        spreadRadius: 1.0,
                        offset: Offset(5, 5),
                      ),
                    ],
                    color: Colors.yellow[200], // 内部の色を指定
                  ),
                  child: ElevatedButton(
                    child: Text(
                      "EpsonConncect登録済みの方",
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SendData(),
                          ));
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
