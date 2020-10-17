import 'package:dio/dio.dart';
import 'package:moovies/models/movie_model.dart';
import 'package:moovies/shared/constants.dart';

class MovieRepository {
  Future<List<Movie>> getPopularMovies({int page = 1}) async {
    List<Movie> popularMovies = List();

    try {
      Response response =
          await Dio().get(Constants.BASE_POPULAR_MOVIES_URL + '$page');
      response.data['results']
          .forEach((item) => popularMovies.add(Movie.fromJson(item)));
      return popularMovies;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
