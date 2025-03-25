import 'package:hive/hive.dart';

import '../../domain/entities/home/movie_home_entity.dart';

void saveDataInHiveBox(List<MovieHomeEntity> movies, String boxName) {
  var box = Hive.box<MovieHomeEntity>(boxName);
  box.addAll(movies);
}