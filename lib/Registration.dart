import 'package:flutter/material.dart';

class Registration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("プリンター登録"),
      ),
      body: SlidePage(),
    );
  }
}

class SlidePage extends StatefulWidget {
  @override
  _SlideshowState createState() => _SlideshowState();
}

class _SlideshowState extends State<SlidePage> {
  // ページコントローラ PageViewの設定   /*画面の何割を占めるか*/
  final PageController controller =
      PageController(initialPage: 0, viewportFraction: 0.8);
  // ページインデックス
  int currentPage = 0;

  // データ
  List<String> _imageList = [
    "images/img01.jpg",
    "images/img02.jpg",
    "images/img03.jpg",
    "images/img04.jpg",
    "images/img05.jpg",
    "images/img06.jpg",
    "images/img07.jpg",
    "images/img08.jpg"
  ];

  List<String> _textList = [
    "プリンターの電源を入れます",
    "プリンターのホーム画面で［設定（セットアップ）］を選択します",
    "［Epson Connect設定］内の［プリンターの登録/削除］を選択します",
    "画面に従ってプリンター登録を進めると、登録シートが印刷されます",
    "登録シートの説明に従い、コンピューターやスマートフォン、タブレット端末を利用して登録してください",
    "ユーザー情報が登録されると、プリンターからセットアップ情報シートが印刷されます。また、登録したメールアドレスに通知メールが送信されます"
  ];

  @override
  void initState() {
    super.initState();

    // ページコントローラのページ遷移を監視しページ数を丸める
    controller.addListener(() {
      int next = controller.page!.round();
      if (currentPage != next) {
        setState(() {
          currentPage = next;
        });
      }
    });
  }

  /*
   * アニメーションカード生成
   */
  AnimatedContainer _createCardAnimate(String imagePath, bool active) {
    // アクティブと非アクティブのアニメーション設定値
    final double top = active ? 100 : 200;
    final double side = active ? 0 : 40;

    return AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeOutQuint,
        margin:
            EdgeInsets.only(top: top, bottom: 50.0, right: side, left: side),
        child: Row(children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: Image.asset(imagePath).image,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(15, 20),
                  spreadRadius: 10.0,
                ),
              ],
            ),
          ),
          Container(
            // 3.1.2行目
            child: Text(
              "Osaka, Japan",
              style: TextStyle(fontSize: 12.0, color: Colors.grey),
            ),
          ),
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      itemCount: _imageList.length,
      itemBuilder: (context, int currentIndex) {
        // アクティブ値
        bool active = currentIndex == currentPage;

        // カードの生成して返す
        return _createCardAnimate(
          _imageList[currentIndex],
          active,
        );
      },
    );
  }
}
