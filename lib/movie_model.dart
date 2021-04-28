import 'package:desafioflutter/movie.dart';
import 'api.dart';

class MovieModel {
  Future<Movie> _movies;

  Future<Movie> get movie => _movies;

  fetchMovies() {
    _movies = API().fetchMovie();

    print(_movies.toString());
  }
}
