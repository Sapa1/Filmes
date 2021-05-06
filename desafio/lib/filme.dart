class Movie {
  String nome;
  String poster_path;
  String release_date;

  Movie.fromJson(Map <String, dynamic> json) {
    nome = json["title"];
    poster_path = json["poster_path"];
    release_date = json["release_date"];
  }
}