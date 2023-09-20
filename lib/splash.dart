import 'package:flutter/material.dart';
void main() {
  // to execute the program main is mandatory
  // runApp attach widget tree to the UI
  runApp(MaterialApp(
    // default theme of our app
    home: MysplashPage(), // initial page
  ));
}

class MysplashPage extends StatelessWidget {
  // this page does not undergo any state changes
  @override
  Widget build(BuildContext context) {
    //locate widget position in widget tree
    //the entire screen
    return Scaffold(
      appBar: AppBar(
        title: Text("My Splash Page"),
      ),
    );
  }
}
