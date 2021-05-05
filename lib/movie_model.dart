import 'package:desafioflutter/movie.dart';
import 'api.dart';

class MovieModel {
  Future<List<Movie>> _movies;

  Future<List<Movie>> get movie => _movies;

  fetchMovies() {
    _movies = API().fetchMovie();
  }
}
