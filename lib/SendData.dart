import 'package:printer_connect/CompletePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';


class SendData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
        .set({'area_code': '13218', 'lat_lng': GeoPoint(53.483959, -2.244644), 'printer_id': printer_id}); // データ

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
      appBar: AppBar(
        title: Text("printer登録フォーム"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: '印刷されたprinterのメールアドレスを入力してください。'),
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
            ElevatedButton(
              child: Text('Printerのアドレスを登録'),
              onPressed: () async {
                // ドキュメント作成
                await FirebaseFirestore.instance
                    .collection('users') // コレクションID
                    .doc() // ドキュメントID
                    .set({'area_code': '132187', 'lat_lng': GeoPoint(lat, lng), 'printer_id': printer_id}
                  ); // データ
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CompletePage(),
                    )
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}