import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/domain/entities/home/movie_home_entity.dart';
import 'package:movies_app/domain/use_cases/home/fetch_home_image_use_case.dart';

part 'fetch_home_image_state.dart';

class FetchHomeImageCubit extends Cubit<FetchHomeImageState> {
  FetchHomeImageCubit(this.fetchHomeImageUseCase) : super(FetchHomeImageInitial());
  final FetchHomeImageUseCase fetchHomeImageUseCase;

  Future<void> fetchHomeImage() async{
    emit(FetchHomeImageLoading());

    var result = await fetchHomeImageUseCase.call();
    result.fold(
        (failure){
          emit(FetchHomeImageFailure(failure.errMessage));
        },
        (movies){
          emit(FetchHomeImageSuccess(movies));
        });
  }
}
