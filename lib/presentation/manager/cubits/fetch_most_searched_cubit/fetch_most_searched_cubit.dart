import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/domain/use_cases/details/fetch_most_searched_use_case.dart';

import '../../../../domain/entities/home/movie_home_entity.dart';

part 'fetch_most_searched_state.dart';

class FetchMostSearchedCubit extends Cubit<FetchMostSearchedState> {
  FetchMostSearchedCubit(this.fetchMostSearchResultUseCase) : super(FetchMostSearchedInitial());
  final FetchMostSearchResultUseCase fetchMostSearchResultUseCase;

  Future<void> fetchMostSearched() async{
    emit(FetchMostSearchedLoading());

    var result = await fetchMostSearchResultUseCase.call();
    result.fold(
            (failure){
          emit(FetchMostSearchedFailure(failure.errMessage));
        },
            (movies){
          emit(FetchMostSearchedSuccess(movies));
        });
  }
}
