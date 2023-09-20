import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(MaterialApp(
    home: LotAnim(),
  ));
}

class LotAnim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lottie"),
      ),
      body: ListView(
        children: [
          SizedBox(
              height: 70,
              width: 70,
              child: Lottie.asset("assets/animation/cute.json")),
          Lottie.network(
              "https://lottie.host/01d3536d-fd31-417f-95ee-247ae1fc7119/wSuFV9HyGx.json"),
          Lottie.network(
              "https://lottie.host/ebb40bd2-acbe-48f6-b49f-88d1648d2c92/Sa5utf9yY9.json")
        ],
      ),
    );
  }
}
