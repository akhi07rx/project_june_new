import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    home: ListView1(),
  ));
}

class ListView1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView"),
      ),
      body: ListView(
        children: [
          Center(
              child: Text(
            "Select Your Food From the menu!!",
            style: GoogleFonts.pacifico(
                fontSize: 30, color: Colors.green, fontWeight: FontWeight.bold),
          )),
          Card(
            child: ListTile(
              title: const Text("HamBurger"),
              subtitle: const Text("\$190"),
              trailing: const Icon(Icons.shopping_cart),
              leading: Image.asset("assets/images/hamburger.png"),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text("Pizza"),
              subtitle: const Text("\$290"),
              trailing: const Icon(Icons.shopping_cart),
              leading: Image.asset("assets/images/pizza.png"),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text("Salad"),
              subtitle: const Text("\$90"),
              trailing: const Icon(
                Icons.shopping_cart,
                color: Colors.teal,
              ),
              leading: Image.asset("assets/images/salad.png"),
            ),
          ),
          const Card(
            child: ListTile(
              title: Text("Biriyani"),
              subtitle: Text("\$120"),
              trailing: Icon(
                Icons.shopping_cart,
                color: Colors.teal,),
              leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://t3.ftcdn.net/jpg/04/59/27/88/360_F_459278894_92eSlejnR7NSwJRCbVyy9ZZibSmjbF8q.jpg")),
            ),
          ),
        ],
      ),
    );
  }
}
