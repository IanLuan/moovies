import 'package:moovies/models/movie_model.dart';
import 'package:moovies/repositories/movie_repository.dart';
import 'package:test/test.dart';

void main() {
  test("Should get popular movies", () async {
    final _movieRepository = MovieRepository();

    List<Movie> _popularMovies = await _movieRepository.getPopularMovies();

    expect(_popularMovies.length, greaterThan(0));
  });
}
