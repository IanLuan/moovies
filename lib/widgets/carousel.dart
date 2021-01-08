import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:moovies/controllers/movie_controller.dart';
import 'package:moovies/models/movie_model.dart';
import 'package:moovies/shared/constants.dart';

class Carousel extends StatelessWidget {
  final ScrollController controller;
  final ObservableList<Movie> list;
  final MovieController _movieController = MovieController();

  Carousel(this.list, this.controller);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final list = _movieController.movies;
        return list != null
            ? ListView.builder(
                controller: controller,
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
                          fit: BoxFit.fill),
                    ),
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
