class Movie {
  String nome;
  String poster_path;
  String release_date;
  double vote_average;
  String overview;

  Movie.fromJson(Map<String, dynamic> json) {
    nome = json["title"];
    poster_path = json["poster_path"];
    release_date = json["release_date"];
    vote_average = json["vote_average"].toDouble() ?? 0.0;
    overview = json["overview"];
  }
}

class MovieResponse {
  List<Movie> movies;

  MovieResponse({
    this.movies,
  });

  MovieResponse.fromJson(Map<String, dynamic> json) {
    final tempList = json['results'] as List;

    movies = tempList.map(
      (item) {
        return Movie.fromJson(item);
      },
    ).toList();
  }
}
