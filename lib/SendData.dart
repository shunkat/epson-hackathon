import 'package:printer_connect/CompletePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart'; // インポート

class SendData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      title: 'プリンターをアプリに登録',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SendDataForm(),
    );
  }
}

class SendDataForm extends StatefulWidget {
  @override
  _SendDataForm createState() => _SendDataForm();
}

class _SendDataForm extends State<SendDataForm> {
  String printer_id = '';
  double lat = 0.0;
  double lng = 0.0;

  //画面初期化時に位置情報を取得する
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void sendData() async {
    // ドキュメント作成
    await FirebaseFirestore.instance
        .collection('users') // コレクションID
        .doc() // ドキュメントID
        .set({
      'area_code': '13218',
      'lat_lng': GeoPoint(53.483959, -2.244644),
      'printer_id': printer_id
    }); // データ
  }

  Future<void> getLocation() async {
    // 現在の位置を返す
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      lat = position.latitude;
      lng = position.longitude;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
        title: Text("printer登録フォーム"),
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 253, 95, 95).withOpacity(0.8),
            Color.fromARGB(255, 129, 0, 221).withOpacity(0.8)
          ],
        ),
      ),
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
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin:
                    EdgeInsets.only(top: 100, bottom: 10, right: 30, left: 30),
                child: TextFormField(
                  decoration: InputDecoration(
                    // labelText: '印刷されたprinterのメールアドレスを入力してください。',
                    hintText: '印刷されたprinterのメールアドレスを入力してください',
                    hintStyle:
                        const TextStyle(fontSize: 12, color: Colors.white),
                    fillColor: Colors.transparent,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 3.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: Colors.green[100]!,
                        width: 3.0,
                      ),
                    ),
                  ),
                  // シンプルなテキスト入力
                  keyboardType: TextInputType.text,
                  // 最大1行
                  maxLines: 1,
                  // 初期値
                  initialValue: printer_id,
                  onChanged: (String value) {
                    setState(() {
                      printer_id = value;
                    });
                  },
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: 30, bottom: 30, right: 30, left: 30),
                decoration: BoxDecoration(
                  // 枠線の装飾、背景色などの指定
                  // color: Colors.white, // 内部の色を指定
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: Color.fromARGB(255, 50, 255, 177),
                      width: 2), //　枠線の色と太さを指定
                ),
                child: ElevatedButton(
                  child: Text(
                    'Printerのアドレスを登録',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      // fontSize: 16,
                      color: Color.fromARGB(255, 50, 255, 177),
                    ),
                  ),
                  onPressed: () async {
                    // ドキュメント作成
                    await FirebaseFirestore.instance
                        .collection('users') // コレクションID
                        .doc() // ドキュメントID
                        .set({
                      'area_code': '13218',
                      'lat_lng': GeoPoint(53.483959, -2.244644),
                      'printer_id': printer_id
                    }); // データ
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CompletePage(),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    elevation: 0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
