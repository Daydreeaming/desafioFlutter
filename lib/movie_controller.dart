import 'package:desafioflutter/movie_model.dart';
import 'package:desafioflutter/movie.dart';

class MovieController {
  final model = MovieModel();

  Future<List<Movie>> get movie => model.movie;

  loadMovie() {
    model.fetchMovies();
    return movie;
  }
}
