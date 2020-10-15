import 'package:mobx/mobx.dart';
import 'package:moovies/models/movie_model.dart';
import 'package:moovies/repositories/movie_repository.dart';
part 'movie_controller.g.dart';

class MovieController = _MovieControllerBase with _$MovieController;

abstract class _MovieControllerBase with Store {
  MovieRepository _movieRepository;

  _MovieControllerBase() {
    _movieRepository = MovieRepository();
  }

  @observable
  ObservableList<Movie> movies;

  @action
  loadPosts() async {
    movies =
        ObservableList<Movie>.of(await _movieRepository.getPopularMovies());
  }
}
