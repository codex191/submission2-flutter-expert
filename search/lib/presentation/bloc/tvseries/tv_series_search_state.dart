part of 'tv_series_search_bloc.dart';

@immutable
abstract class SearchTvSeriesState extends Equatable {}

class SearchTvSeriesEmpty extends SearchTvSeriesState {
  @override
  List<Object> get props => [];
}

class SearchTvSeriesLoading extends SearchTvSeriesState {
  @override
  List<Object> get props => [];
}

class SearchTvSeriesError extends SearchTvSeriesState {
  final String message;

  SearchTvSeriesError(this.message);

  @override
  List<Object> get props => [message];
}

class SearchTvSeriesHasData extends SearchTvSeriesState {
  final List<TvSeries> result;

  SearchTvSeriesHasData(this.result);

  @override
  List<Object> get props => [result];
}