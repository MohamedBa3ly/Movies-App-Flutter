part of 'fetch_most_searched_cubit.dart';

@immutable
sealed class FetchMostSearchedState {}

final class FetchMostSearchedInitial extends FetchMostSearchedState {}
final class FetchMostSearchedLoading extends FetchMostSearchedState {}
final class FetchMostSearchedSuccess extends FetchMostSearchedState {
  final List<MovieHomeEntity> movies;
  FetchMostSearchedSuccess(this.movies);
}
final class FetchMostSearchedFailure extends FetchMostSearchedState {
  final String errMessage;
  FetchMostSearchedFailure(this.errMessage);
}
