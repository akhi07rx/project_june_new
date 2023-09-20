import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ListView2(),
  ));
}

class ListView2 extends StatelessWidget {
  var name = [
    "food1",
    "food2",
    "food3",
    "food4",
    "food5",
    "food6",
    "food7",
    "food8",
    "food9",
    "food10"
  ];
  var image = [
    "assets/images/donut.png",
    "assets/images/hamburger.png",
    "assets/images/pizza.png",
    "assets/images/ramen.png",
    "assets/images/salad.png",
    "assets/images/grapes.png",
    "assets/images/mango.png",
    "assets/images/donut.png",
    "assets/images/hamburger.png",
    "assets/images/pizza.png"
  ];
  var price = [250, 300, 400, 590, 120, 58, 340, 230, 100, 160];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("ListView 2"),
        actions: [
          const Icon(Icons.camera_alt),
          const SizedBox(
            width: 20,
          ),
          const Icon(Icons.search),
          const SizedBox(
            width: 10,
          ),
          PopupMenuButton(itemBuilder: (context) {
            return [
              const PopupMenuItem(child: Text("Settings")),
              const PopupMenuItem(child: Text("Profile")),
              const PopupMenuItem(child: Text("BroadCast")),
              const PopupMenuItem(child: Text("Help")),
            ];
          })
        ],
      ),
      body: ListView(
        children: List.generate(
            10,
            (index) => Card(
                  child: ListTile(
                    title: Text(name[index]),
                    subtitle: Text("\$ ${price[index]}"),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(image[index]),
                    ),
                    trailing: const Wrap(
                      direction: Axis.vertical,
                        children: [
                      Text("12.30"),
                      SizedBox(width:10),
                      CircleAvatar(
                        minRadius: 4,
                        maxRadius: 10,
                        backgroundColor: Colors.green,
                      child: Text("2"),)
                    ]),
                  ),
                )),
      ),
    );
  }
}
