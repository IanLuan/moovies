import 'dart:convert';
import 'package:moovies/repositories/movie_repository_interface.dart';
import 'package:moovies/models/movie_model.dart';
import 'package:http/http.dart' as http;
import 'package:moovies/shared/constants.dart';

class MovieRepository implements IMovieRepository {
  @override
  Future<List<Movie>> getPopularMovies({int page = 1}) async {
    List<Movie> popularMovies = List();

    final response =
        await http.get(Constants.BASE_POPULAR_MOVIES_URL + "$page");

    if (response.statusCode == 200) {
      var decodeJson = jsonDecode(response.body);
      decodeJson.forEach((item) => popularMovies.add(Movie.fromJson(item)));
      return popularMovies;
    } else {
      print("Erro ao carregar lista" + response.statusCode.toString());
      return null;
    }
  }
}
