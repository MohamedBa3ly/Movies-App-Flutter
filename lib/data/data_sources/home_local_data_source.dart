import 'package:hive/hive.dart';
import 'package:movies_app/core/utils/constants.dart';

import '../../domain/entities/home/movie_home_entity.dart';

abstract class HomeLocalDataSource{
  List<MovieHomeEntity> fetchHomeImage();
  List<MovieHomeEntity> fetchHomeTrendingNow({int page = 1});
  List<MovieHomeEntity> fetchHomeAction();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource{

  @override
  List<MovieHomeEntity> fetchHomeImage() {
    var box = Hive.box<MovieHomeEntity>(imageHomeBox);
    return box.values.toList();
  }

  @override
  List<MovieHomeEntity> fetchHomeTrendingNow({int page = 1}) {
    int startIndex = (page - 1) * 20;
    int endIndex = page * 20;
    var box = Hive.box<MovieHomeEntity>(trendingHomeBox);

    int length = box.values.length;
    if(startIndex >= length || endIndex > length){
      return [];
    }
    return box.values.toList().sublist(startIndex,endIndex);
  }

  @override
  List<MovieHomeEntity> fetchHomeAction() {
    var box = Hive.box<MovieHomeEntity>(actionHomeBox);
    return box.values.toList();
  }



}