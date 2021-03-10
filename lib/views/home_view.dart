import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:moovies/viewmodel/trending_viewmodel.dart';
import 'package:moovies/shared/constants.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TrendingViewModel trendingViewModel;

  @override
  void initState() {
    super.initState();
    trendingViewModel = TrendingViewModel();
    trendingViewModel.getPopularMovies(page: 1);
    trendingViewModel.getUpcomingMovies(page: 1);
    trendingViewModel.getPopularPeople(page: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  iconSize: 30.0,
                  icon: Icon(Icons.home, color: Colors.grey[400]),
                  onPressed: () {},
                ),
                IconButton(
                  iconSize: 30.0,
                  icon: Icon(Icons.bookmark, color: Colors.grey[400]),
                  onPressed: () {},
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xFF1432C5),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      )),
                  child: IconButton(
                    iconSize: 30.0,
                    icon: Icon(Icons.search, color: Colors.white),
                    onPressed: () {},
                  ),
                ),
                IconButton(
                  iconSize: 30.0,
                  icon: Icon(Icons.notifications, color: Colors.grey[400]),
                  onPressed: () {},
                ),
                IconButton(
                  iconSize: 30.0,
                  icon: Icon(Icons.person, color: Colors.grey[400]),
                  onPressed: () {},
                ),
              ],
            )),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(icon: Icon(Icons.menu), onPressed: () {}),
                    Text("Moovies",
                        style: GoogleFonts.openSans(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                    IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: 4.0, left: 16, right: 16, bottom: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(0, 3))
                    ]),
                child: SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: RaisedButton(
                    padding: EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 0,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 10, bottom: 10, left: 12, right: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                ),
                              ),
                              Text("Search on films",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300)),
                            ],
                          ),
                        ),
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Color(0xFF1432C5),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: Icon(
                            Icons.tune,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 12.0, top: 12.0, bottom: 12.0),
                child: Text(
                  "Popular this week",
                  style: GoogleFonts.openSans(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                height: 180,
                padding: EdgeInsets.only(bottom: 12),
                child: RxBuilder(
                  builder: (_) {
                    final list = trendingViewModel.popularMovies.value;
                    return list != null
                        ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: list.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(
                                    left: index == 0 ? 12 : 12,
                                    right: index == list.length - 1 ? 9 : 0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.network(
                                    Constants.BASE_IMAGE_URL +
                                        '${list[index].posterPath}',
                                    height: 180,
                                    fit: BoxFit.fill,
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
              Padding(
                  padding: const EdgeInsets.only(
                      left: 12.0, top: 12.0, bottom: 12.0),
                  child: Text(
                    "Popular actors this week",
                    style: GoogleFonts.openSans(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  )),
              Container(
                height: 150,
                padding: EdgeInsets.only(bottom: 12),
                child: RxBuilder(
                  builder: (_) {
                    final list = trendingViewModel.popularPeople.value;
                    return list != null
                        ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: list.length,
                            itemBuilder: (context, index) {
                              return Container(
                                  margin: EdgeInsets.only(
                                      left: index == 0 ? 12 : 12,
                                      right: index == list.length - 1 ? 9 : 0),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    minRadius: 60,
                                    backgroundImage: NetworkImage(
                                        Constants.BASE_IMAGE_URL +
                                            '${list[index].profilePath}'),
                                  ));
                            },
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          );
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 12.0, top: 12.0, bottom: 12.0),
                child: Text(
                  "Upcoming films",
                  style: GoogleFonts.openSans(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                height: 180,
                padding: EdgeInsets.only(bottom: 12),
                child: RxBuilder(
                  builder: (_) {
                    final list = trendingViewModel.upcomingMovies.value;
                    return list != null
                        ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: list.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(
                                    left: index == 0 ? 12 : 12,
                                    right: index == list.length - 1 ? 9 : 0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.network(
                                    Constants.BASE_IMAGE_URL +
                                        '${list[index].posterPath}',
                                    height: 180,
                                    fit: BoxFit.fill,
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
              Padding(
                padding:
                    const EdgeInsets.only(left: 12.0, top: 12.0, bottom: 12.0),
                child: Text(
                  "Upcoming films",
                  style: GoogleFonts.openSans(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                height: 180,
                padding: EdgeInsets.only(bottom: 12),
                child: RxBuilder(
                  builder: (_) {
                    final list = trendingViewModel.upcomingMovies.value;
                    return list != null
                        ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: list.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(
                                    left: index == 0 ? 12 : 12,
                                    right: index == list.length - 1 ? 9 : 0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.network(
                                    Constants.BASE_IMAGE_URL +
                                        '${list[index].posterPath}',
                                    height: 180,
                                    fit: BoxFit.fill,
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
              Padding(
                padding:
                    const EdgeInsets.only(left: 12.0, top: 12.0, bottom: 12.0),
                child: Text(
                  "Upcoming films",
                  style: GoogleFonts.openSans(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                height: 180,
                padding: EdgeInsets.only(bottom: 12),
                child: RxBuilder(
                  builder: (_) {
                    final list = trendingViewModel.upcomingMovies.value;
                    return list != null
                        ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: list.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(
                                    left: index == 0 ? 12 : 12,
                                    right: index == list.length - 1 ? 9 : 0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.network(
                                    Constants.BASE_IMAGE_URL +
                                        '${list[index].posterPath}',
                                    height: 180,
                                    fit: BoxFit.fill,
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
            ],
          ),
        ),
      ),
    );
  }
}
