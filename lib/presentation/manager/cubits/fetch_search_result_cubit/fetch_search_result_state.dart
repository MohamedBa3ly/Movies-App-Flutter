part of 'fetch_search_result_cubit.dart';

@immutable
sealed class FetchSearchResultState {}

final class FetchSearchResultInitial extends FetchSearchResultState {}
final class FetchSearchResultLoading extends FetchSearchResultState {}
final class FetchSearchResultSuccess extends FetchSearchResultState {
  final List<MovieHomeEntity> movies;
  FetchSearchResultSuccess(this.movies);
}
final class FetchSearchResultFailure extends FetchSearchResultState {
  final String errMessage;
  FetchSearchResultFailure(this.errMessage);
}
