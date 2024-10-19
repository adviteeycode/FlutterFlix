import 'dart:convert';

import 'package:flutterflix/models/movie_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutterflix/constants/constant.dart';

class Api {
  static const String _trendingUrl =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=$apiKey';

  static const String _topRatedUrl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey';

  static const String _upcomingUrl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey';

  Future<List<Movie>> getTrendingMovies() async {
    // geting response from the TMDB using trending url
    final http.Response response = await http.get(Uri.parse(_trendingUrl));
    if (response.statusCode == 200) {
      final List decodeData = json.decode(response.body)['results'];
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Something happened bad!");
    }
  }

  Future<List<Movie>> getTopRatedMovies() async {
    // getting response from TMDB for TopRated Movies
    final http.Response response = await http.get(Uri.parse(_topRatedUrl));
    if (response.statusCode == 200) {
      final List decodeData = json.decode(response.body)['results'];
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Something happened bad!");
    }
  }

  Future<List<Movie>> getUpcomingMovies() async {
    // getting response from TMDB for Upcoming movies
    final http.Response response = await http.get(Uri.parse(_upcomingUrl));
    if (response.statusCode == 200) {
      final List decodeData = json.decode(response.body)['results'];
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Something happened bad!");
    }
  }

  Future<List<Img>> getMovieScreenShots(int movieId) async {
    String url =
        'https://api.themoviedb.org/3/movie/$movieId/images?api_key=$apiKey';
    final http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List decodeData = json.decode(response.body)['backdrops'];
      return decodeData.map((img) => Img.fromJson(img)).toList();
    } else {
      throw Exception("Something happened bad!");
    }
  }
}
