part of 'fetch_home_trending_cubit.dart';

@immutable
sealed class FetchHomeTrendingState {}

final class FetchHomeTrendingInitial extends FetchHomeTrendingState {}
final class FetchHomeTrendingLoading extends FetchHomeTrendingState {}
final class FetchHomeTrendingPaginationLoading extends FetchHomeTrendingState {
  final List<MovieHomeEntity> movies;
  FetchHomeTrendingPaginationLoading(this.movies);
}
final class FetchHomeTrendingSuccess extends FetchHomeTrendingState {
  final List<MovieHomeEntity> movies;
  FetchHomeTrendingSuccess(this.movies);
}
final class FetchHomeTrendingFailure extends FetchHomeTrendingState {
  final String errMessage;
  FetchHomeTrendingFailure(this.errMessage);
}

final class FetchHomeTrendingPaginationFailure extends FetchHomeTrendingState {
  final String errMessage;
  final List<MovieHomeEntity> movies;
  FetchHomeTrendingPaginationFailure(this.errMessage, this.movies);
}
