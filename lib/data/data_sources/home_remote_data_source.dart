import 'package:hive/hive.dart';
import 'package:movies_app/core/utils/api_keys.dart';
import 'package:movies_app/core/utils/api_service.dart';
import 'package:movies_app/core/utils/constants.dart';
import 'package:movies_app/data/models/action_most_searched_search_movies_model.dart';
import 'package:movies_app/data/models/trending_movies_model.dart';

import '../../core/utils/functions.dart';
import '../../domain/entities/home/movie_home_entity.dart';

abstract class HomeRemoteDataSource{
  Future<List<MovieHomeEntity>> fetchHomeImage();
  Future<List<MovieHomeEntity>> fetchHomeTrendingNow({int page = 1});
  Future<List<MovieHomeEntity>> fetchHomeAction();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource{
  final ApiService apiService;
  HomeRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<MovieHomeEntity>> fetchHomeImage() async{
    var data = await apiService.get(endPoint: 'movie/now_playing', token: ApiKeys.token);

    List<MovieHomeEntity> movies = getMoviesList(data);

    saveDataInHiveBox(movies, imageHomeBox);

    return movies;
  }



  @override
  Future<List<MovieHomeEntity>> fetchHomeTrendingNow({int page = 1}) async{
    var data = await apiService.get(endPoint: 'trending/movie/day?language=en-US&page=$page', token: ApiKeys.token);

    List<MovieHomeEntity> movies = [];
    for(var movie in data['results']){
      movies.add(TrendingMoviesModel.fromJson(movie));
    }

    saveDataInHiveBox(movies, trendingHomeBox);
    return movies;
  }


  @override
  Future<List<MovieHomeEntity>> fetchHomeAction() async {
    var data = await apiService.get(endPoint: 'movie/popular', token: ApiKeys.token);

    List<MovieHomeEntity> movies = getMoviesList(data);

    saveDataInHiveBox(movies, actionHomeBox);

    return movies;

  }


  List<MovieHomeEntity> getMoviesList(Map<String, dynamic> data) {
    List<MovieHomeEntity> movies = [];
    for(var movie in data['results']){
      movies.add(ActionMostSearchedSearchMoviesModel.fromJson(movie));
    }
    return movies;
  }

}