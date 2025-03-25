import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failures.dart';
import 'package:movies_app/data/repository/movie_repository.dart';
import 'package:movies_app/domain/entities/home/movie_home_entity.dart';
import 'package:movies_app/domain/use_cases/use_case.dart';

class FetchSearchResultUseCase extends UseCase<List<MovieHomeEntity>, String> {
  final MovieRepository movieRepository;
  FetchSearchResultUseCase(this.movieRepository);

  @override
  Future<Either<Failure, List<MovieHomeEntity>>> call([String? movieName]) async {
    return await movieRepository.fetchSearchResult(movieName: movieName!);
  }

}