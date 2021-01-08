// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovieController on _MovieControllerBase, Store {
  final _$moviesAtom = Atom(name: '_MovieControllerBase.movies');

  @override
  ObservableList<Movie> get movies {
    _$moviesAtom.reportRead();
    return super.movies;
  }

  @override
  set movies(ObservableList<Movie> value) {
    _$moviesAtom.reportWrite(value, super.movies, () {
      super.movies = value;
    });
  }

  final _$getPopularMoviesAsyncAction =
      AsyncAction('_MovieControllerBase.getPopularMovies');

  @override
  Future getPopularMovies({int page}) {
    return _$getPopularMoviesAsyncAction
        .run(() => super.getPopularMovies(page: page));
  }

  final _$morePopularMoviesAsyncAction =
      AsyncAction('_MovieControllerBase.morePopularMovies');

  @override
  Future morePopularMovies({int page}) {
    return _$morePopularMoviesAsyncAction
        .run(() => super.morePopularMovies(page: page));
  }

  @override
  String toString() {
    return '''
movies: ${movies}
    ''';
  }
}
