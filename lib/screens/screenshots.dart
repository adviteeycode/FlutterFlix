import 'package:flutter/material.dart';
import 'package:flutterflix/models/movie_model.dart';
import 'package:flutterflix/services/api.dart';
import 'package:flutterflix/widgets/custom_text.dart';
import 'package:flutterflix/widgets/image_slider.dart';

class MovieScreenShots extends StatefulWidget {
  final int movieId;
  final String title;
  const MovieScreenShots(
      {super.key, required this.movieId, required this.title});

  @override
  State<MovieScreenShots> createState() => _MovieScreenShotsState();
}

class _MovieScreenShotsState extends State<MovieScreenShots> {
  late Future<List<Img>> _movieScreenshots;

  @override
  void initState() {
    super.initState();
    Api api = Api();
    _movieScreenshots = api.getMovieScreenShots(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          data: widget.title,
          size: 23,
        ),
      ),
      body: SizedBox(
        height: 700,
        child: SingleChildScrollView(
          child: SizedBox(
            child: FutureBuilder(
                future: _movieScreenshots,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  } else if (snapshot.hasData) {
                    return ImageSlider(snapshot: snapshot);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          ),
        ),
      ),
    );
  }
}
