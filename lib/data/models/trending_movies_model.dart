
import 'package:movies_app/domain/entities/home/movie_home_entity.dart';

class TrendingMoviesModel extends MovieHomeEntity {
  final String? backdropPath;
  final int id;
  final String title;
  final String originalTitle;
  final String overview;
  final String? posterPath;
  final String mediaType;
  final bool adult;
  final String originalLanguage;
  final List<int> genreIds;
  final double popularity;
  final String releaseDate;
  final bool video;
  final double voteAverage;
  final int voteCount;

  TrendingMoviesModel({
    this.backdropPath,
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    this.posterPath,
    required this.mediaType,
    required this.adult,
    required this.originalLanguage,
    required this.genreIds,
    required this.popularity,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  }): super(id, posterPath, releaseDate, voteAverage, title, overview);

  /// Convert JSON to Movie object
  factory TrendingMoviesModel.fromJson(Map<String, dynamic> json) {
    return TrendingMoviesModel(
      backdropPath: json['backdrop_path'],
      id: json['id'],
      title: json['title'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      mediaType: json['media_type'],
      adult: json['adult'],
      originalLanguage: json['original_language'],
      genreIds: List<int>.from(json['genre_ids']),
      popularity: (json['popularity'] as num).toDouble(),
      releaseDate: json['release_date'],
      video: json['video'],
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'],
    );
  }



}
