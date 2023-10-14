import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:project_june1/statemanagement%20using%20provider/model/models.dart';

final List<Movies> movieList =
List.generate(100, (index) =>
    Movies(
        title: 'Movie $index', time: '${Random().nextInt(100) = 60} minutes'));

class MovieProvider extends ChangeNotifier {}
