import 'package:movies_app/core/utils/constants.dart';
import 'package:movies_app/data/models/action_most_searched_search_movies_model.dart';

import '../../core/utils/api_keys.dart';
import '../../core/utils/api_service.dart';
import '../../core/utils/functions.dart';
import '../../domain/entities/home/movie_home_entity.dart';

abstract class DetailsRemoteDataSource{
  Future< List<MovieHomeEntity>> fetchMostSearched();
}

class DetailsRemoteDataSourceImpl extends DetailsRemoteDataSource{
  final ApiService apiService;
  DetailsRemoteDataSourceImpl(this.apiService);


  @override
  Future<List<MovieHomeEntity>> fetchMostSearched() async{

    var data = await apiService.get(endPoint: 'movie/top_rated', token: ApiKeys.token);

    List<MovieHomeEntity> movies = [];
    for(var movie in data['results']){
      movies.add(ActionMostSearchedSearchMoviesModel.fromJson(movie));
    }

    saveDataInHiveBox(movies, mostSearchedBox);

    return movies;
  }

}