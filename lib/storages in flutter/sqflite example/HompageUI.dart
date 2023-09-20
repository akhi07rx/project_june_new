import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  final data;
  const Homepage({Key? key,required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var name  = data[0]['name'];
    return Scaffold(
      appBar: AppBar(title: Text("Home Page"),),
      body: Center(
        child: Text('Login Success...............Welcome $name',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
      ),

    );
  }
}

