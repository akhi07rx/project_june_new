import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: Drawer_Ex(),));
}
class Drawer_Ex extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage("https://plus.unsplash.com/premium_photo-1673706007413-9f6ede022596?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"))
              ),
                accountName: Text("My Name"),
                accountEmail: Text("myname@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage("https://static.independent.co.uk/s3fs-public/thumbnails/image/2017/09/27/08/jennifer-lawrence.jpg"),
                ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGBCbqy1Nc0V95OxsN0HJ0vviyNNhfSVY3SQ&usqp=CAU"),),
                CircleAvatar(
                  backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGBCbqy1Nc0V95OxsN0HJ0vviyNNhfSVY3SQ&usqp=CAU"),)
              ],
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("About"),
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Help"),
            )
          ],
        ),
      ),
    );
  }
}
