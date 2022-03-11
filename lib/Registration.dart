import 'package:flutter/material.dart';
import 'package:printer_connect/ActivationWebView.dart';

class Registration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("プリンター登録"),
        ),
        body: Center(
            child: TextButton(
                onPressed: () => {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return ActivationWebView();
                  }))
                },
                child: Text("進む", style: TextStyle(fontSize: 80)))));
  }
}