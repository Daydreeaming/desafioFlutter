import 'package:desafioflutter/movie_model.dart';
import 'package:desafioflutter/movie.dart';
import 'dart:async';

class MovieViewModel {
  final _model = MovieModel();
  bool favorite = false;

  Future<List<Movie>> get movie => _model.movie;

  StreamController<List<Movie>> streamLista = StreamController();

  loadMovie() async {
    await _model.fetchMovies().then(
          (value) => {
            print(value),
            streamLista.sink.add(value),
          },
        );
  }
}
