import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ListView_Separated(),
  ));
}

class ListView_Separated extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Separated'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return const SizedBox(
              height: 50,
              child: Card(
                child: Align(
                    alignment:Alignment.centerLeft,
                    child: Text("January")),
              ),
            );
          },
          separatorBuilder: (context, index) {
            if (index % 4 == 0) {
              return const Card(
                color: Colors.red,
                child: Text("Advertisement"),
              );
            } else {
              return const SizedBox();
            }
          },
          itemCount: 10),
    );
  }
}
