import 'package:desafioflutter/Storage/SQLAdapter.dart';
import 'package:desafioflutter/Storage/internal_storage.dart';
import 'package:desafioflutter/Models/movie.dart';
import '../Network/TMDBApi.dart';

class MovieModel {
  final api = API();
  final InternalStorageAdapter internalStorage;

  MovieModel({InternalStorageAdapter internalStorageAdapter})
      : internalStorage = internalStorageAdapter ?? SQLAdapter();

  Future<List<Movie>> _movies;

  Future<List<Movie>> get movie => _movies;

  Future<List<Movie>> fetchMovies(int page) {
    _movies = API().fetchMovie(page);
    return _movies;
  }

  Future<dynamic>isFavorite(id) {
    return internalStorage.isFavorite(id);
  }

  Future<void> changeFavorite(int id, bool favorite) {
    return internalStorage.changeFavorite(id, favorite);
  }
}
