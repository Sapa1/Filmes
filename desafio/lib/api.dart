// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class API {
//   Future <Movie> fetchMovie(int number) async {
//     final response = await http.get(Uri.https('api.themoviedb.org/3/movie/upcoming?api_key=a5bc05fb630c9b7fdc560033345fa13e&language=en-US&page=1'));

//     if(response.statusCode == 200){
//       return Movie.fromJson(jsonDecode(response.title));
//     }else{}
//   }
// }



import 'package:http/http.dart' as http;

class API{
  fetchMovie(){
    final response = http.get(Uri.https('api.themoviedb.org', '/3/movie/upcoming?api_key=a5bc05fb630c9b7fdc560033345fa13e&language=en-US&page=1'));
  }
}

