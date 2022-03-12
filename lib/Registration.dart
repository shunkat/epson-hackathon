import 'package:flutter/material.dart';
import 'package:printer_connect/url_launch.dart';

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
    "images/trim_img01.png",
    "images/trim_img02.png",
    "images/trim_img03.png",
    "images/trim_img04.png",
    "images/trim_img05.png",
    "images/trim_img06.png",
    "images/trim_img07.png",
    "images/trim_img08.png",
    "aaa"
  ];

  List<String> _textList = [
    "プリンターの電源を入れ、プリンターのホーム画面で［設定（セットアップ）］を選択します",
    "本体設定を選択します",
    "プリンター設定を選択します",
    "［Epson Connect設定］を選択します",
    "［プリンターの登録］を選択します",
    "設定を開始するを選択します。",
    "画面に従ってプリンター登録を進めると、登録シートが印刷されます",
    "登録シートの説明に従い、コンピューターやスマートフォン、タブレット端末を利用して登録してください。ユーザー情報が登録されると、プリンターからセットアップ情報シートが印刷されます。また、登録したメールアドレスに通知メールが送信されます。",
    "aaa"
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
  AnimatedContainer _createCardAnimate(
      String count, String imagePath, String text, bool active) {
    // アクティブと非アクティブのアニメーション設定値
    final double top = active ? 100 : 200;
    final double side = active ? 0 : 40;

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOutQuint,
      margin: EdgeInsets.only(top: top, bottom: 50.0, right: side, left: side),
      child: Column(children: <Widget>[
        Visibility(
          visible: active,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 107, 156, 247)),
              borderRadius: BorderRadius.circular(17.0),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                  top: 10.0, bottom: 10.0, right: 20.0, left: 20.0),
              child: Text(
                count,
                style: TextStyle(
                    fontSize: 25.0, color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
          ),
        ),
        Container(
          height: 220,
          width: 400,
          margin: EdgeInsets.only(top: 15, bottom: 15, right: 0, left: 0),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: Image.asset(imagePath).image,
            ),
          ),
        ),
        Container(
          child: Visibility(
            visible: active,
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 15.0, color: Color.fromARGB(255, 0, 0, 0)),
            ),
          ),
        ),
      ]),
    );
  }

  AnimatedContainer _createFinalCardAnimate(
      String count, String imagePath, String text, bool active) {
    // アクティブと非アクティブのアニメーション設定値
    final double top = active ? 100 : 200;
    final double side = active ? 0 : 40;

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOutQuint,
      margin: EdgeInsets.only(top: top, bottom: 50.0, right: side, left: side),
      child: UrlLauncher(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      itemCount: _imageList.length,
      itemBuilder: (context, int currentIndex) {
        // アクティブ値
        bool active = currentIndex == currentPage;
        String number = (currentIndex + 1).toString();

        return Center(
          child: ifCard(currentIndex, number, active),
        );
      },
    );
  }

  Widget ifCard(int currentIndex, String number, bool active) {
    if (number == "9") {
      return _createFinalCardAnimate(
        (currentIndex + 1).toString(),
        _imageList[currentIndex],
        _textList[currentIndex],
        active,
      );
    } else {
      // カードの生成して返す
      return _createCardAnimate(
        (currentIndex + 1).toString(),
        _imageList[currentIndex],
        _textList[currentIndex],
        active,
      );
    }
  }
}
