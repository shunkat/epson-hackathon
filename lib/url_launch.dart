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
      body: Container(
        width: 180, //横幅
        height: 80, //高さ
        margin: EdgeInsets.only(top: 200, bottom: 30, right: 60, left: 60),
        decoration: BoxDecoration(
          // 枠線の装飾、背景色などの指定
          // color: Colors.white, // 内部の色を指定

          borderRadius: BorderRadius.circular(10),
          // border: Border.all(color: Color.fromARGB(255, 0, 0, 0), width: 2), //　枠線の色と太さを指定
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 253, 95, 95).withOpacity(0.8),
              Color.fromARGB(255, 129, 0, 221).withOpacity(0.8),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          // child: RaisedButton(
          //   child: Text('ブラウザでURLを開く'),
          //   onPressed: () {
          //     _launchInBrowser();
          //   },
          // ),
          child: ElevatedButton(
            child: Text(
              "ブラウザでURLを開く",
              textAlign: TextAlign.center,
              style: TextStyle(
                // fontSize: 16,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            onPressed: () {
              _launchInBrowser();
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              elevation: 0,
            ),
          ),
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
