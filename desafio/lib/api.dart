import 'dart:convert';

import 'package:http/http.dart' as http;

import 'filme.dart';

class API {
  final String autorizado = 'api.themoviedb.org';
  final String path = '/3/movie/upcoming';
  // final Map<String, dynamic> queryParameters = {
  //   'api_key': 'a5bc05fb630c9b7fdc560033345fa13e',
  //   'page': 1,
  // };

  Future<MovieResponse> fetchMovie(int page) async {
    final Map<String, dynamic> queryParameters = {
      'api_key': 'a5bc05fb630c9b7fdc560033345fa13e',
      'page': '$page',
    };
    final response =
        await http.get(Uri.https(autorizado, path, queryParameters));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      return MovieResponse.fromJson(json);
    } else {
      throw Future.error('Movie not found');
    }
  }
}
