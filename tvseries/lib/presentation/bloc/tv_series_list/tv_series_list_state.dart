part of 'tv_series_list_bloc.dart';

@immutable
abstract class TvSeriesListState extends Equatable {}

class TvSeriesListEmpty extends TvSeriesListState {
  @override
  List<Object?> get props => [];
}

class TvSeriesListLoading extends TvSeriesListState {
  @override
  List<Object?> get props => [];
}

class TvSeriesListError extends TvSeriesListState {
  final String message;

  TvSeriesListError(this.message);

  @override
  List<Object> get props => [message];
}

class TvSeriesListHasData extends TvSeriesListState {
  final List<TvSeries> result;

  TvSeriesListHasData(this.result);

  @override
  List<Object?> get props => [result];
}