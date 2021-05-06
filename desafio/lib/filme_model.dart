import 'api.dart';
import 'filme.dart';

class MovieModel {
  Future<List<Movie>> movie;

  final api = API();

  fetchMovie() {
    movie = api.fetchMovie();
  }
}
