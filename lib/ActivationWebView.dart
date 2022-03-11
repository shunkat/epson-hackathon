import 'package:flutter/material.dart';
import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';


class ActivationWebView extends StatefulWidget {
  @override
  _ActivationWebView createState() => _ActivationWebView();
}

class _ActivationWebView extends State<ActivationWebView> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EpsonConnect 登録ページ'),
      ),
      body: Center(
        child: WebView(
          initialUrl: "https://www.epsonconnect.com/activation/",
          javascriptMode: JavascriptMode.unrestricted
        ),
      ),
    );
  }
}