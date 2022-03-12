import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:core';

class UrlLauncher extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UrlLauncher();
}

class _UrlLauncher extends State<UrlLauncher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text('ブラウザでURLを開く'),
          onPressed: () {
            _launchInBrowser();
          },
        ),
      ),
    );
  }

// ブラウザで開く
  _launchInBrowser() async {
    const url = 'https://www.epsonconnect.com/activation#/';
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      throw 'このURLにはアクセスできません';
    }
  }
}
