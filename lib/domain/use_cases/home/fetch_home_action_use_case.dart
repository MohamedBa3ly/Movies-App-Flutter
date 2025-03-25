import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failures.dart';
import 'package:movies_app/data/repository/movie_repository.dart';
import 'package:movies_app/domain/entities/home/movie_home_entity.dart';
import 'package:movies_app/domain/use_cases/use_case.dart';

class FetchHomeActionUseCase extends UseCase<List<MovieHomeEntity>, NoParam> {
  final MovieRepository movieRepository;
  FetchHomeActionUseCase(this.movieRepository);

  @override
  Future<Either<Failure, List<MovieHomeEntity>>> call([NoParam? param]) async {
    return await movieRepository.fetchHomeAction();
  }

}