import 'package:flutter/material.dart';
import 'package:project_june1/statemanagement%20using%20provider/provider/movieProvider.dart';
import 'package:provider/provider.dart';

class MovieMain extends StatelessWidget {
  const MovieMain({super.key});

  @override
  Widget build(BuildContext context) {
    var wishmovies = context.watch<MovieProvider>().movieWishList;
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
          Expanded(
              child: ListView.builder(
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    //movies are list<map> here currentMovie is now a map
                    final currentMovie = movies[index];
                    return Card(
                      child: ListTile(
                        title: Text(currentMovie.title),
                        subtitle: Text(currentMovie.time!),
                        trailing: IconButton(
                            onPressed: () {
                              if (!wishmovies.contains(currentMovie)) {
                                context
                                    .read<MovieProvider>()
                                    .addtoWishList(currentMovie);
                              } else {
                                context
                                    .read<MovieProvider>()
                                    .removeFromWishList(currentMovie);
                              }
                            },
                            icon: Icon(
                              Icons.favorite_border,
                              color: wishmovies.contains(currentMovie)
                                  ? Colors.red
                                  : Colors.white,
                            )),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
