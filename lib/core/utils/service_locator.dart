import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_app/data/data_sources/details_local_data_source.dart';
import 'package:movies_app/data/data_sources/details_remote_data_source.dart';
import 'package:movies_app/data/data_sources/home_local_data_source.dart';
import 'package:movies_app/data/data_sources/home_remote_data_source.dart';
import 'package:movies_app/data/data_sources/search_local_data_source.dart';
import 'package:movies_app/data/data_sources/search_remote_data_source.dart';
import 'package:movies_app/data/repository/movie_repository_impl.dart';

import 'api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator(){
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<MovieRepositoryImpl>(MovieRepositoryImpl(
      homeRemoteDataSource: HomeRemoteDataSourceImpl(getIt.get<ApiService>()),
      homeLocalDataSource: HomeLocalDataSourceImpl(),
      detailsRemoteDataSource: DetailsRemoteDataSourceImpl(getIt.get<ApiService>()),
      detailsLocalDataSource: DetailsLocalDataSourceImpl(),
      searchRemoteDataSource: SearchRemoteDataSourceImpl(getIt.get<ApiService>()),
      searchLocalDataSource: SearchLocalDataSourceImpl()
  ));
}

