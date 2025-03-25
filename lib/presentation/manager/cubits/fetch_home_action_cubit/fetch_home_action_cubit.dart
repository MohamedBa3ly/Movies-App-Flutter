import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/domain/use_cases/home/fetch_home_action_use_case.dart';

import '../../../../domain/entities/home/movie_home_entity.dart';

part 'fetch_home_action_state.dart';

class FetchHomeActionCubit extends Cubit<FetchHomeActionState> {
  FetchHomeActionCubit(this.fetchHomeActionUseCase) : super(FetchHomeActionInitial());
  final FetchHomeActionUseCase fetchHomeActionUseCase;

  Future<void> fetchHomeAction() async{
    emit(FetchHomeActionLoading());

    var result = await fetchHomeActionUseCase.call();
    result.fold(
            (failure){
          emit(FetchHomeActionFailure(failure.errMessage));
        },
            (movies){
          emit(FetchHomeActionSuccess(movies));
        });
  }
}
