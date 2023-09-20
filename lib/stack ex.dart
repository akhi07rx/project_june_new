import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: StackEx(),
  ));
}

class StackEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack Example"),
      ),
      body: Center(
        child: Stack(
          children: [
            Container(
              height: 300,
              width: 500,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1691443297137-68818fe7bce9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1032&q=80"))),
            ),
            const Positioned(
              left: 20,
              top: 20,
              child: Text("ANNA THOMAS",
                style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Positioned(
              right: 30,
              bottom: 10,
              child: Text(
                'EXP : 11.10.2032',
                style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Positioned(
              left: 50,
                right: 50,
                bottom: 50,
                top: 50,
                child: Icon(
                  Icons.food_bank_outlined,
                  size: 50,
                color: Colors.white70,))
          ],
        ),
      ),
    );
  }
}
