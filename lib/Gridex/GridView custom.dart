import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: GridCustom(),
  ));
}

class GridCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridView.Custom"),
      ),
      body: GridView.custom(
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          childrenDelegate:
          SliverChildListDelegate(List.generate(12,
              (index) => Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: const DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                        "https://images.unsplash.com/photo-1690233318473-7672623f7767?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80")
                                )),
                          ),
                          const Text(
                            "Item.1",
                            style: TextStyle(
                                fontSize:20 , fontWeight: FontWeight.bold),
                          ),
                          const Text("\$ 280", style: TextStyle(fontSize: 15)),
                        ],
                      ),
                    ),
                  )))),
    );
  }
}
