import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Expandeddd(),
  ));
}

class Expandeddd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Container(
                child: Image.network(
                    "https://images.unsplash.com/photo-1560498888-a3364485f43b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8Mnw0OTQyNjZ8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=600&q=60"),
              )),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: Image.network(
                  "https://images.unsplash.com/photo-1560498888-a3364485f43b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8Mnw0OTQyNjZ8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=600&q=60")),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: Image.network(
                  "https://images.unsplash.com/photo-1560498888-a3364485f43b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8Mnw0OTQyNjZ8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=600&q=60")),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: Image.network(
                  "https://images.unsplash.com/photo-1560498888-a3364485f43b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8Mnw0OTQyNjZ8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=600&q=60"))
        ],
      ),
    );
  }
}
