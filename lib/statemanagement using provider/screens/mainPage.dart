import 'package:flutter/material.dart';
import 'package:project_june1/statemanagement%20using%20provider/provider/movieProvider.dart';
import 'package:provider/provider.dart';

class MovieMain extends StatelessWidget {
  const MovieMain({super.key});

  @override
  Widget build(BuildContext context) {
    var
    var movies = context.watch<MovieProvider>().movies;

    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
      ),
      body: Column(
        children: [
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.favorite_border),
            label: Text("Goto WishList"),
          ),
          Expanded(child: ListView.builder(itemBuilder: (context, index) {
            return Card(
              child: ListTile(),
            );
          }))
        ],
      ),
    );
  }
}
