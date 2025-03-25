import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/domain/use_cases/home/fetch_home_trending_now_use_case.dart';

import '../../../../domain/entities/home/movie_home_entity.dart';

part 'fetch_home_trending_state.dart';

class FetchHomeTrendingCubit extends Cubit<FetchHomeTrendingState> {
  FetchHomeTrendingCubit(this.fetchHomeTrendingNowUseCase) : super(FetchHomeTrendingInitial());
  final FetchHomeTrendingNowUseCase fetchHomeTrendingNowUseCase;

  List<MovieHomeEntity> allMovies = [];

  Future<void> fetchHomeTrending({int page = 1}) async{

    print("paaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaage: $page");

    if(page == 1){
      emit(FetchHomeTrendingLoading());
      allMovies.clear();
    }else{
      emit(FetchHomeTrendingPaginationLoading(allMovies));
    }

    var result = await fetchHomeTrendingNowUseCase.call(page);
    result.fold(
            (failure){
              if(page == 1){
                emit(FetchHomeTrendingFailure(failure.errMessage));
              }else{
                emit(FetchHomeTrendingPaginationFailure(failure.errMessage,allMovies));
              }
        },
            (movies){
              allMovies.addAll(movies);
          emit(FetchHomeTrendingSuccess(List.from(allMovies)));
        });
  }
}
