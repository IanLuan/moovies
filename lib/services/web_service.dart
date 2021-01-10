import 'package:dio/dio.dart';
import 'package:moovies/models/movie_model.dart';
import 'package:moovies/shared/constants.dart';

class WebService {
  Future<List<Movie>> getPopularMovies({int page}) async {
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

  Future<List<Movie>> getUpcomingMovies({int page}) async {
    List<Movie> upcomingMovies = List();

    try {
      Response response =
          await Dio().get(Constants.BASE_UPCOMING_MOVIES_URL + '$page');
      response.data['results']
          .forEach((item) => upcomingMovies.add(Movie.fromJson(item)));
      return upcomingMovies;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<Movie>> getPopularPeople({int page}) async {
    List<Movie> popularPeople = List();

    try {
      Response response =
          await Dio().get(Constants.BASE_POPULAR_PEOPLE_URL + '$page');
      response.data['results']
          .forEach((item) => popularPeople.add(Movie.fromJson(item)));
      print(popularPeople[0].posterPath);
      return popularPeople;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
