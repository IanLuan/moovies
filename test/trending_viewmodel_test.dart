import 'package:moovies/models/movie_model.dart';
import 'package:moovies/viewmodel/trending_viewmodel.dart';
import 'package:test/test.dart';

void main() {
  final trendingViewModel = TrendingViewModel();

  test("Should get popular movies", () async {
    await trendingViewModel.getPopularMovies(page: 1);
    expect(trendingViewModel.popularMovies.value.length, greaterThan(0));
  });

  test("Should get upcoming movies", () async {
    await trendingViewModel.getUpcomingMovies(page: 1);
    expect(trendingViewModel.upcomingMovies.value.length, greaterThan(0));
  });
}
