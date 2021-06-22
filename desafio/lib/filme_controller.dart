import 'dart:async';

import 'package:desafio/filme_model.dart';

import 'filme.dart';

class HomeViewModel {
  final model = MovieModel();
  int page = 1;
  List<Movie> movieList = [];

  // Future<List<Movie>> get movie => model.movie;

  StreamController<List<Movie>> streamLista = StreamController();

  loadMovie() {
    model.fetchMovie(page);
    model.movie.then(
      (value) {
        movieList.addAll(value.movies);

        streamLista.add(movieList);
      },
    );
  }

  newPage() {
    page++;
    print(page);
    loadMovie();
  }
}
