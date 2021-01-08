import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:moovies/controllers/movie_controller.dart';
import 'package:moovies/shared/constants.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  MovieController _movieController;
  int _currentPage = 1;
  String message = "opaa";

  @override
  void initState() {
    super.initState();
    _movieController = MovieController();
    _movieController.getPopularMovies(page: 1);
  }

  _onStartScroll(ScrollMetrics metrics) {
    setState(() {
      message = "Scroll Start";
    });
  }

  _onUpdateScroll(ScrollMetrics metrics) {
    setState(() {
      if (metrics.extentAfter <= 50) {
        _currentPage++;
        _movieController.morePopularMovies(page: _currentPage);
      }
    });
  }

  _onEndScroll(ScrollMetrics metrics) {
    setState(() {
      message = "end";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {},
          )
        ],
        title: Text(message),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 8.0, bottom: 4.0),
            child: Text(
              "Lançamentos",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 170,
            child: Observer(
              builder: (context) {
                final list = _movieController.movies;
                return list != null
                    ? NotificationListener<ScrollNotification>(
                        onNotification: (scrollNotification) {
                          if (scrollNotification is ScrollStartNotification) {
                            _onStartScroll(scrollNotification.metrics);
                          } else if (scrollNotification
                              is ScrollUpdateNotification) {
                            _onUpdateScroll(scrollNotification.metrics);
                          } else if (scrollNotification
                              is ScrollEndNotification) {
                            _onEndScroll(scrollNotification.metrics);
                          }
                        },
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(
                                  left: index == 0 ? 12 : 8,
                                  right: index == list.length - 1 ? 9 : 0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Image.network(
                                  Constants.BASE_IMAGE_URL +
                                      '${list[index].posterPath}',
                                  height: 170,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      );
              },
            ),
          ),
          Container(
            height: 170,
            child: Observer(
              builder: (context) {
                final list = _movieController.movies;
                return list != null
                    ? NotificationListener<ScrollNotification>(
                        onNotification: (scrollNotification) {
                          if (scrollNotification is ScrollStartNotification) {
                            _onStartScroll(scrollNotification.metrics);
                          } else if (scrollNotification
                              is ScrollUpdateNotification) {
                            _onUpdateScroll(scrollNotification.metrics);
                          } else if (scrollNotification
                              is ScrollEndNotification) {
                            _onEndScroll(scrollNotification.metrics);
                          }
                        },
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(
                                  left: index == 0 ? 12 : 8,
                                  right: index == list.length - 1 ? 9 : 0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Image.network(
                                  Constants.BASE_IMAGE_URL +
                                      '${list[index].posterPath}',
                                  height: 170,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
