part of 'tv_series_popular_bloc.dart';

@immutable
abstract class TvSeriesPopularState extends Equatable {}

class TvSeriesPopularEmpty extends TvSeriesPopularState {
  @override
  List<Object?> get props => [];
}

class TvSeriesPopularLoading extends TvSeriesPopularState {
  @override
  List<Object?> get props => [];
}

class TvSeriesPopularError extends TvSeriesPopularState {
  final String message;

  TvSeriesPopularError(this.message);

  @override
  List<Object?> get props => [message];
}

class TvSeriesPopularHasData extends TvSeriesPopularState {
  final List<TvSeries> result;

  TvSeriesPopularHasData(this.result);

  @override
  List<Object?> get props => [];
}