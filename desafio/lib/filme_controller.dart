import 'package:desafio/filme_model.dart';

import 'filme.dart';

class MovieController {
  final model = MovieModel();


Future<List<Movie>> get movie => model.movie;



  loadMovie(){
    model.fetchMovie();
  }
}