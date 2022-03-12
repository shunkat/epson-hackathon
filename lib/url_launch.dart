import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:core';

class SampleUrlLauncher extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SampleUrlLauncher();
}

class _SampleUrlLauncher extends State<SampleUrlLauncher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('url_launcher'),
      ),
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
