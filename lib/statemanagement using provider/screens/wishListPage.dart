import 'package:flutter/material.dart';
import 'package:project_june1/statemanagement%20using%20provider/provider/movieProvider.dart';
import 'package:provider/provider.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var wishmovies = context.watch<MovieProvider>().movieWishList;
    return Scaffold(
      appBar: AppBar(
        title: Text("My WishList ${wishmovies.length}"),
      ),
      body: ListView.builder(
        itemCount: wishmovies.length,
        itemBuilder: (context, index) {
          final wishMovie = wishmovies[index];
          return Card(
            child: ListTile(
              title: Text(wishMovie.title),
              subtitle: Text(wishMovie.time!),
              trailing: TextButton(
                  onPressed: () {
                    context.read<MovieProvider>().removeFromWishList(wishMovie);
                  },
                  child: Text("Remove")),
            ),
          );
        },
      ),
    );
  }
}
