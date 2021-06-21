import 'package:desafioflutter/DetailMovie/movie_model.dart';
import 'package:desafioflutter/Models/movie.dart';
import 'dart:async';

class MovieViewModel {
  final _model = MovieModel();
  var page = 1;

  List<Movie> arrayMovie = [];

  Future<List<Movie>> get movie => _model.movie;

  StreamController<List<Movie>> streamLista = StreamController();

  loadMovie() async {
    await _model.fetchMovies(page).then(
          (value) =>
              {arrayMovie.addAll(value), streamLista.add(arrayMovie), page++},
        );
  }

  dynamic isFavorite(int id) {
    return _model.isFavorite(id);
  }

  void changeFavorite(int id, bool favorite) {
    _model.changeFavorite(id, favorite);
  }
}
