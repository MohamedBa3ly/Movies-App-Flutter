import 'package:hive/hive.dart';
import 'package:movies_app/core/utils/constants.dart';

import '../../domain/entities/home/movie_home_entity.dart';

abstract class SearchLocalDataSource{
  List<MovieHomeEntity> fetchSearchResult({required String movieName});
}

class SearchLocalDataSourceImpl extends SearchLocalDataSource {
  @override
  List<MovieHomeEntity> fetchSearchResult({required String movieName}) {
    var box = Hive.box<MovieHomeEntity>(searchHomeBox);
    return box.values.toList();
  }

}