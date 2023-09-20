import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: GridView3(),
  ));
}

class GridView3 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.extent(
        maxCrossAxisExtent: 60,
        children: List.generate(
            15,
                (index) => const Card(
              child: Center(
                child: Text("Hello"),
              ),
            )),
      ),
    );
  }
}
