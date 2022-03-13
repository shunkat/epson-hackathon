import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart'; // インポート

class CompletePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
        title: Text("登録完了"),
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
          child: Container(
            child: Text(
              "登録完了!!!",
              style: TextStyle(
                  fontSize: 22.0, color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ),
        ),
      ),
    );
  }
}
