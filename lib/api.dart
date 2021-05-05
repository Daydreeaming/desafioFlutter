import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:desafioflutter/movie.dart';

class API {
  Future<List<Movie>> fetchMovie() async {
    final response = await http.get(Uri.https(
      'api.themoviedb.org',
      '/3/movie/upcoming',
      {'api_key': 'a5bc05fb630c9b7fdc560033345fa13e'},
    ));

    if (response.statusCode == 200) {
      List<dynamic> arrayMovies;

      var json = jsonDecode(response.body);
      List jsonResults = json['results'] as List;

      arrayMovies = jsonResults.map((item) {
        Movie movie = Movie.fromJson(item);
        return movie;
      }).toList();

      return arrayMovies;
    } else {
      return Future.error('Movies not found');
    }
  }
}
