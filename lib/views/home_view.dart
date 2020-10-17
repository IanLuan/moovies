import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:moovies/controllers/movie_controller.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  MovieController _movieController;

  @override
  void initState() {
    super.initState();
    _movieController = MovieController();
    _movieController.getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _movieController.getPopularMovies();
            },
          )
        ],
        title: Text('MVC Example - Posts'),
      ),
      body: Container(
        child: Observer(
          builder: (context) {
            final list = _movieController.movies;
            return list != null
                ? ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: ListTile(
                            onTap: () {},
                            title: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                list[index].title,
                              ),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${list[index].popularity}',
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}
