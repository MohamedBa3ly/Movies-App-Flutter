import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failures.dart';
import 'package:movies_app/data/repository/movie_repository.dart';
import 'package:movies_app/domain/entities/home/movie_home_entity.dart';
import 'package:movies_app/domain/use_cases/use_case.dart';

class FetchHomeTrendingNowUseCase extends UseCase<List<MovieHomeEntity>, int> {
  final MovieRepository movieRepository;
  FetchHomeTrendingNowUseCase(this.movieRepository);

  @override
  Future<Either<Failure, List<MovieHomeEntity>>> call([int param= 1]) async {
    return await movieRepository.fetchHomeTrendingNow(page: param);
  }

}