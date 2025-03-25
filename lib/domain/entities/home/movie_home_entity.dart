

import 'package:hive/hive.dart';
part 'movie_home_entity.g.dart';

@HiveType(typeId: 0)
class MovieHomeEntity{
  @HiveField(0)
  final int movieId;
  @HiveField(1)
  final String? image;
  @HiveField(2)
  final String year;
  @HiveField(3)
  final double rating;
  @HiveField(4)
  final String title;
  @HiveField(5)
  final String overView;
  MovieHomeEntity(this.movieId, this.image, this.year, this.rating, this.title,this.overView);
}