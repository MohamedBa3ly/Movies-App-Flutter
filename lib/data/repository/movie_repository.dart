import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/home/movie_home_entity.dart';
import '../../core/errors/failures.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<MovieHomeEntity>>> fetchHomeImage();
  Future<Either<Failure, List<MovieHomeEntity>>> fetchHomeTrendingNow({int page = 1});
  Future<Either<Failure, List<MovieHomeEntity>>> fetchHomeAction();
  Future<Either<Failure, List<MovieHomeEntity>>> fetchSearchResult({required String movieName});
  Future<Either<Failure, List<MovieHomeEntity>>> fetchMostSearched();
}