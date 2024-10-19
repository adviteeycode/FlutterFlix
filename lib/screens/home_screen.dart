import 'package:flutter/material.dart';
import 'package:flutterflix/models/movie_model.dart';
import 'package:flutterflix/services/api.dart';
import 'package:flutterflix/widgets/appbar_title.dart';
import 'package:flutterflix/widgets/custom_text.dart';
import 'package:flutterflix/widgets/movie_slider.dart';
import 'package:flutterflix/widgets/trending_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Movie>> _trendingMovies;
  late Future<List<Movie>> _topRatedMovies;
  late Future<List<Movie>> _upcomingMovies;
  @override
  void initState() {
    super.initState();
    Api api = Api();
    _trendingMovies = api.getTrendingMovies();
    _topRatedMovies = api.getTopRatedMovies();
    _upcomingMovies = api.getUpcomingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const AppBarTitle(),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 8),
              child: CustomText(data: "Trending", size: 23),
            ),
            SizedBox(
              child: FutureBuilder(
                  future: _trendingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    } else if (snapshot.hasData) {
                      return TrendingSlider(snapshot: snapshot);
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8),
              child: CustomText(data: "Top Rated Movies", size: 23),
            ),
            SizedBox(
              child: FutureBuilder(
                  future: _topRatedMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return MovieSlider(snapshot: snapshot);
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8),
              child: CustomText(data: "Upcoming Movies", size: 23),
            ),
            SizedBox(
              child: FutureBuilder(
                  future: _upcomingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    } else if (snapshot.hasData) {
                      return MovieSlider(snapshot: snapshot);
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
