part of 'fetch_home_action_cubit.dart';

@immutable
sealed class FetchHomeActionState {}

final class FetchHomeActionInitial extends FetchHomeActionState {}
final class FetchHomeActionLoading extends FetchHomeActionState {}
final class FetchHomeActionSuccess extends FetchHomeActionState {
  final List<MovieHomeEntity> movies;
  FetchHomeActionSuccess(this.movies);
}
final class FetchHomeActionFailure extends FetchHomeActionState {
  final String errMessage;
  FetchHomeActionFailure(this.errMessage);
}
