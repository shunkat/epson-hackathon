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
        primarySwatch: Colors.blueGrey,
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomRight,
            colors: [
              Color.fromARGB(255, 253, 95, 95).withOpacity(0.8),
              Color.fromARGB(255, 129, 0, 221).withOpacity(0.8),
            ],
            stops: const [
              0.0,
              1.0,
            ],
          ),
        ),
        child: OrientationBuilder(
          builder: (context, orientation) {
            return Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 230, //横幅
                    height: 200, //高さ
                    margin: EdgeInsets.only(
                        top: 130, bottom: 80, right: 30, left: 30),
                    child: Text(
                      "EpsonConnect登録\nまだ登録していない方はNo Registeredのボタン\n登録済みの方はAlready Registeredのボタン\nを押してください",
                      // "Click the No Registered button if you are not yet registered with EpsonConnect, or click the Already Registered button if you are registered with EpsonConnect",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                  Container(
                    width: 180, //横幅
                    height: 50, //高さ
                    margin: EdgeInsets.only(
                        top: 30, bottom: 30, right: 30, left: 30),
                    decoration: BoxDecoration(
                      // 枠線の装飾、背景色などの指定
                      // color: Colors.white, // 内部の色を指定
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Color.fromARGB(255, 255, 255, 255),
                          width: 2), //　枠線の色と太さを指定

                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.black26,
                      //     blurRadius: 3.0,
                      //     spreadRadius: 1.0,
                      //     offset: Offset(5, 5),
                      //   ),
                      // ],
                    ), // 内部の色を指定,
                    child: ElevatedButton(
                      child: Text(
                        "Not registered",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          // fontSize: 16,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Registration(),
                            ));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                      ),
                    ),
                  ),
                  Container(
                    width: 180, //横幅
                    height: 50, //高さ
                    margin: EdgeInsets.only(
                        top: 20, bottom: 30, right: 30, left: 30),
                    decoration: BoxDecoration(
                      // 枠線の装飾、背景色などの指定
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Color.fromARGB(255, 255, 255, 255),
                          width: 2), //　枠線の色と太さを指定

                      boxShadow: [
                        BoxShadow(
                          color: Colors.transparent,
                          blurRadius: 3.0,
                          spreadRadius: 1.0,
                          offset: Offset(5, 5),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      child: Text(
                        "Already registered",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SendData(),
                            ));
                      },
                      style: ElevatedButton.styleFrom(
                        primary:
                            // Color.fromARGB(255, 255, 155, 155).withOpacity(0.5),
                            Colors.transparent,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
