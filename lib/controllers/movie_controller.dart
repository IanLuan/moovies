import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:moovies/models/movie_model.dart';
import 'package:moovies/repositories/movie_repository.dart';
import 'package:rx_notifier/rx_notifier.dart';
/*
class MovieController = _MovieControllerBase with _$MovieController;

abstract class _MovieControllerBase with Store {
  MovieRepository _movieRepository;

  _MovieControllerBase() {
    _movieRepository = MovieRepository();
  }

  @observable
  ObservableList<Movie> movies;

  @action
  getPopularMovies({int page}) async {
    movies = ObservableList<Movie>.of(
        await _movieRepository.getPopularMovies(page: page));
  }

  @action
  morePopularMovies({int page}) async {
    //Movie movie1 = Movie(posterPath: "/cfhfcEt4bOXuVZkTC0nNBpqqiWb.jpg");
    List<Movie> newMovies = await _movieRepository.getPopularMovies(page: page);
    movies.addAll(newMovies);
  }
}

*/

class MovieController {
  final _movieRepository = MovieRepository();
  final movies = ValueNotifier([]).asRx();

  getPopularMovies({int page}) async {
    movies.value = await _movieRepository.getPopularMovies(page: page);
  }
}
