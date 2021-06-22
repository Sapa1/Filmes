import 'api.dart';
import 'filme.dart';

class MovieModel {
  Future<MovieResponse> movie;

  final api = API();

  fetchMovie(int page) {
    movie = api.fetchMovie(page);
  }
}
