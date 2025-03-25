import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movies_app/core/utils/constants.dart';
import 'package:movies_app/domain/entities/home/movie_home_entity.dart';
import 'package:movies_app/navigation/navgraph.dart';

import 'core/utils/service_locator.dart';

void main() async {

  //Setup DI - (GetIt)
  setupServiceLocator();

  //Hive
  await Hive.initFlutter();
  Hive.registerAdapter(MovieHomeEntityAdapter());
  await Hive.openBox<MovieHomeEntity>(imageHomeBox);
  await Hive.openBox<MovieHomeEntity>(trendingHomeBox);
  await Hive.openBox<MovieHomeEntity>(actionHomeBox);
  await Hive.openBox<MovieHomeEntity>(mostSearchedBox);
  await Hive.openBox<MovieHomeEntity>(searchHomeBox);

  runApp(const NavGraph());



}


