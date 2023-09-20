import 'package:flutter/material.dart';


void main() {
  runApp( MaterialApp(
        home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var screenOrientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
        title: const Text('MediaQuery'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'This device is $screenWidth x $screenHeight',
            ),
            const SizedBox(
              height: 20,
            ),
            screenWidth >= 1280 && screenHeight >= 720
                ? Container(
              height: 100,
              width: 700,
              color: Colors.red,
            )
                : Container(
              height: 100,
              width: 100,
              color: Colors.blue,
            ),
            const SizedBox(
              height: 20,
            ),
            screenOrientation == Orientation.portrait
                ? const Text(
              'This device is in portrait mode',
            )
                : const Text(
              'This device is in landscape mode',
            ),
          ],
        ),
      ),
    );
  }
}