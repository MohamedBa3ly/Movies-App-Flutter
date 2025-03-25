part of 'fetch_home_image_cubit.dart';

@immutable
sealed class FetchHomeImageState {}

final class FetchHomeImageInitial extends FetchHomeImageState {}
final class FetchHomeImageLoading extends FetchHomeImageState {}
final class FetchHomeImageSuccess extends FetchHomeImageState {
  final List<MovieHomeEntity> movies;
  FetchHomeImageSuccess(this.movies);
}
final class FetchHomeImageFailure extends FetchHomeImageState {
  final String errMessage;
  FetchHomeImageFailure(this.errMessage);
}
