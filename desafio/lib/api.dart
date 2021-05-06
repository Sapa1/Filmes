import 'dart:convert';

import 'package:desafio/filme.dart';
import 'package:http/http.dart' as http;

class API {
  final String autorizado = 'api.themoviedb.org';
  final String path = '/3/movie/upcoming';
  final Map<String, dynamic> queryParameters = {
    'api_key': 'a5bc05fb630c9b7fdc560033345fa13e'
  };

  Future<List<Movie>> fetchMovie() async {
    final response =
        await http.get(Uri.https(autorizado, path, queryParameters));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      Iterable lista = json["results"];
      return lista.map((filme) => Movie.fromJson(filme)).toList();
    } else {
      throw Future.error('Movie not found');
    }
  }
}
