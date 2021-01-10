import 'package:flutter/material.dart';
import 'package:moovies/models/movie_model.dart';
import 'package:moovies/services/web_service.dart';
import 'package:rx_notifier/rx_notifier.dart';

class TrendingViewModel {
  final webservice = WebService();
  final popularMovies = ValueNotifier([]).asRx();
  final upcomingMovies = ValueNotifier([]).asRx();
  final popularPeople = ValueNotifier([]).asRx();

  getPopularMovies({int page}) async {
    popularMovies.value = await webservice.getPopularMovies(page: page);
  }

  getUpcomingMovies({int page}) async {
    upcomingMovies.value = await webservice.getUpcomingMovies(page: page);
  }

  getPopularPeople({int page}) async {
    popularPeople.value = await webservice.getPopularPeople(page: page);
  }
}
