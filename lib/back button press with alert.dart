import 'package:flutter/material.dart';

class ExitAppAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<bool> showAlert() async {
      return await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Ext"),
              content: const Text('Do You Really want to Exit'),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: const Text("Yes")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: const Text("No")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: const Text("Cancel")),
              ],
            );
          });
    }
    return WillPopScope(
        onWillPop: showAlert,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("EXIT FROM APP"),
          ),
          body: const Center(
            child: Text("Press Back Button TO Exit!!!"),
          ),
        ));
  }
}

void main(){
  runApp(MaterialApp(home: ExitAppAlert(),));
}