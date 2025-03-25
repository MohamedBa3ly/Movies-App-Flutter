import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/core/errors/failures.dart';
import 'package:movies_app/data/data_sources/details_local_data_source.dart';
import 'package:movies_app/data/data_sources/details_remote_data_source.dart';
import 'package:movies_app/data/data_sources/home_local_data_source.dart';
import 'package:movies_app/data/data_sources/home_remote_data_source.dart';
import 'package:movies_app/data/data_sources/search_local_data_source.dart';
import 'package:movies_app/data/data_sources/search_remote_data_source.dart';
import 'package:movies_app/data/repository/movie_repository.dart';
import 'package:movies_app/domain/entities/home/movie_home_entity.dart';


class MovieRepositoryImpl implements MovieRepository {

  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;
  final DetailsRemoteDataSource detailsRemoteDataSource;
  final DetailsLocalDataSource detailsLocalDataSource;
  final SearchRemoteDataSource searchRemoteDataSource;
  final SearchLocalDataSource searchLocalDataSource;

  MovieRepositoryImpl({
  required this.homeRemoteDataSource,
  required this.homeLocalDataSource,
  required this.detailsRemoteDataSource,
  required this.detailsLocalDataSource,
  required this.searchRemoteDataSource,
  required this.searchLocalDataSource
  });

  @override
  Future<Either<Failure, List<MovieHomeEntity>>> fetchHomeImage() async{
    List<MovieHomeEntity> movies ;
    try{

      movies = homeLocalDataSource.fetchHomeImage();
      if(movies.isNotEmpty){
        return right(movies);
      }

      movies = await homeRemoteDataSource.fetchHomeImage();
      return right(movies);

    }catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }

  }

  @override
  Future<Either<Failure, List<MovieHomeEntity>>> fetchHomeTrendingNow({int page = 1}) async{
    List<MovieHomeEntity> movies ;
    try{

      movies = homeLocalDataSource.fetchHomeTrendingNow(page: page);
      if(movies.isNotEmpty){
        return right(movies);
      }

      movies = await homeRemoteDataSource.fetchHomeTrendingNow(page: page);
      return right(movies);

    }catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<MovieHomeEntity>>> fetchHomeAction() async{
    List<MovieHomeEntity> movies ;
    try{

      movies = homeLocalDataSource.fetchHomeAction();
      if(movies.isNotEmpty){
        return right(movies);
      }

      movies = await homeRemoteDataSource.fetchHomeAction();
      return right(movies);

    }catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<MovieHomeEntity>>> fetchMostSearched() async{
    List<MovieHomeEntity> movies ;
    try{

      movies = detailsLocalDataSource.fetchMostSearched();
      if(movies.isNotEmpty){
        return right(movies);
      }

      movies = await detailsRemoteDataSource.fetchMostSearched();
      return right(movies);

    }catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<MovieHomeEntity>>> fetchSearchResult({required String movieName}) async{
    List<MovieHomeEntity> movies ;
    try{

      // movies = searchLocalDataSource.fetchSearchResult(movieName: movieName);
      // if(movies.isNotEmpty){
      //   return right(movies);
      // }

      movies = await searchRemoteDataSource.fetchSearchResult(movieName: movieName);
      return right(movies);

    }catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }

  }
}