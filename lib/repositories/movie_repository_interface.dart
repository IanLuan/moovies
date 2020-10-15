import 'package:moovies/models/movie_model.dart';

abstract class IMovieRepository {
  Future<List<Movie>> getPopularMovies();

  //Future<List<Movie>> getFavoriteMovies();
  //void addFavoriteMovie();
  //Future<List<Movie>> searchMovies();
}
