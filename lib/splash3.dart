import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project_june1/stateful%20login%20with%20validation.dart';

void main() {
  runApp(MaterialApp(
    home: Splash3(),
  ));
}

class Splash3 extends StatefulWidget {
  //splash3 is initially immutable
  @override
  State<Splash3> createState() =>
      _Splash3State(); //createState() will  creatae a mutable state for splash3
}

class _Splash3State extends State<Splash3> {
  @override
  void initState() {
    //what will happen when the app or page is first launched
    Timer(Duration(seconds: 1), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Login2()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/icons/butterfly.png"),
      ),
    );
  }
}
