import 'package:hive/hive.dart';
import 'package:movies_app/core/utils/constants.dart';

import '../../domain/entities/home/movie_home_entity.dart';

abstract class DetailsLocalDataSource{
  List<MovieHomeEntity> fetchMostSearched();
}

class DetailsLocalDataSourceImpl extends DetailsLocalDataSource{
  @override
  List<MovieHomeEntity> fetchMostSearched() {
    var box = Hive.box<MovieHomeEntity>(mostSearchedBox);
    return box.values.toList();
  }

}