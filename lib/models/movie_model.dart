class Movie {
  final int movieId;
  final String title;
  final String overview;
  final String backDropPath;
  final String posterPath;
  final String releaseDate;
  final double voteAverage;
  final List genre;

  Movie({
    required this.movieId,
    required this.title,
    required this.overview,
    required this.backDropPath,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.genre,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      movieId: json['id'],
      title: json['title'] ?? 'TITLE',
      overview: json['overview'] ?? 'OVERVIEW',
      backDropPath: json['backdrop_path'] ?? 'BACKDROP_PATH',
      posterPath: json['poster_path'] ?? 'POSTER_PATH',
      releaseDate: json['release_date'] ?? 'RELEASE_DATE',
      voteAverage: json['vote_average'] ?? 'VOTE_AVERAGE',
      genre: json['genre_ids'],
    );
  }
}

//////////////////////////////////////////////////////////////

// Img = Image
class Img {
  final int height;
  final int width;
  final double aspectRatio;
  final String filePath;
  final double voteAverage;

  Img({
    required this.height,
    required this.width,
    required this.aspectRatio,
    required this.filePath,
    required this.voteAverage,
  });

  factory Img.fromJson(Map<String, dynamic> json) {
    return Img(
      height: json['height'],
      width: json['width'],
      aspectRatio: json['aspect_ratio'],
      filePath: json['file_path'],
      voteAverage: json['vote_average'],
    );
  }
}
