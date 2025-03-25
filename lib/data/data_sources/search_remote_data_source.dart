import '../../core/utils/api_keys.dart';
import '../../core/utils/api_service.dart';
import '../../core/utils/constants.dart';
import '../../core/utils/functions.dart';
import '../../domain/entities/home/movie_home_entity.dart';
import '../models/action_most_searched_search_movies_model.dart';

abstract class SearchRemoteDataSource{
  Future< List<MovieHomeEntity>> fetchSearchResult({required String movieName});
}

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource{
  final ApiService apiService;
  SearchRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<MovieHomeEntity>> fetchSearchResult({required String movieName}) async{

    var data = await apiService.get(endPoint: 'search/movie?query=$movieName', token: ApiKeys.token);

    List<MovieHomeEntity> movies = [];
    for(var movie in data['results']){
      movies.add(ActionMostSearchedSearchMoviesModel.fromJson(movie));
    }

    // saveDataInHiveBox(movies, searchHomeBox);

    return movies;
  }

}