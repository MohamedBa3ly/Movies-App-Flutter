import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/domain/use_cases/search/fetch_search_result_use_case.dart';

import '../../../../domain/entities/home/movie_home_entity.dart';

part 'fetch_search_result_state.dart';

class FetchSearchResultCubit extends Cubit<FetchSearchResultState> {
  final FetchSearchResultUseCase fetchSearchResultUseCase;
  Timer? _debounceTimer;

  FetchSearchResultCubit(this.fetchSearchResultUseCase)
      : super(FetchSearchResultInitial());

  Future<void> fetchSearchResult(String movieName) async {
    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();

    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      if (movieName.isEmpty) {
        emit(FetchSearchResultInitial());
        return;
      }

      emit(FetchSearchResultLoading());

      var result = await fetchSearchResultUseCase.call(movieName);
      result.fold(
            (failure) => emit(FetchSearchResultFailure(failure.errMessage)),
            (movies) => emit(FetchSearchResultSuccess(movies)),
      );
    });
  }

  @override
  Future<void> close() {
    _debounceTimer?.cancel();
    return super.close();
  }
}

// class FetchSearchResultCubit extends Cubit<FetchSearchResultState> {
//   FetchSearchResultCubit(this.fetchSearchResultUseCase) : super(FetchSearchResultInitial());
//   final FetchSearchResultUseCase fetchSearchResultUseCase;
//
//   Future<void> fetchSearchResult(String movieName) async{
//     emit(FetchSearchResultLoading());
//
//     var result = await fetchSearchResultUseCase.call(movieName);
//     result.fold(
//             (failure){
//           emit(FetchSearchResultFailure(failure.errMessage));
//         },
//             (movies){
//           emit(FetchSearchResultSuccess(movies));
//         });
//   }
// }
