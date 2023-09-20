import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Splash2()));
}

class Splash2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        ///  set background color way 1
        //  backgroundColor: Colors.grey,
        body: Container(
          ///  set background color way 2 using gradient inside container
        decoration: const BoxDecoration(
          // gradient: LinearGradient(
          //     begin: Alignment.bottomLeft,
          //     end: Alignment.topRight,
          //     colors: [Colors.purple, Colors.white70, Colors.purpleAccent])
          ///  set background color way 3 using Image
          image: DecorationImage(
             fit: BoxFit.cover,
              image: AssetImage("assets/images/backimage.jpg"))
        ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon(
            //   Icons.sailing_outlined,
            //   size: 80,
            //   color: Colors.purple,
            // ),
            Image.asset(
              "assets/icons/butterfly.png",
              height: 200,
              width: 200,
            ),
            const Text(
              "My Application",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    ));
  }
}
