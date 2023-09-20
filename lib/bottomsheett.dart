import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main(){
  runApp(MaterialApp(home: BottomSheeett(),));
}
class BottomSheeett extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bottom sheet with image on tap"),
      ),
      body: Center(
        child: GestureDetector(
            // use can use InkWell also for performing events
            onLongPress: () => showSheet(context),
            child: Image.asset("assets/images/bibimbap.png",height: 200,width: 200,)),
      ),
    );
  }

  void showSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.whatsapp,
                    color: Colors.green,
                  ),
                  title: Text("WhatsApp"),
                ),
                ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.facebook,
                    color: Colors.blue,
                  ),
                  title: Text("facebook"),
                ),
                ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.message,
                    color: Colors.black,
                  ),
                  title: Text("Message"),
                )
              ],
            ),
          );
        });
  }
}
