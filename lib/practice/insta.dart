import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MaterialApp(
    home: Instaa(),
  ));
}

class Instaa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100,),
            ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (Rect bounds) => const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.deepPurple,
                        Colors.pink,
                        Colors.orange,
                      ],
                    ).createShader(bounds),
                child: FaIcon(
                  FontAwesomeIcons.instagram,
                  size: 100,
                )),
            SizedBox(height: 200,),
            Text("From",style: TextStyle(color: Colors.white70),),
            SizedBox(height: 10,),
            Text("Meta",style: TextStyle(color: Colors.white70),)
          ],
        ),
      ),
    );
  }
}
