part of 'tv_series_top_rated_bloc.dart';

@immutable
abstract class TvSeriesTopRatedState extends Equatable {}

class TvSeriesTopRatedEmpty extends TvSeriesTopRatedState {
  @override
  List<Object?> get props => [];
}

class TvSeriesTopRatedLoading extends TvSeriesTopRatedState {
  @override
  List<Object?> get props => [];
}

class TvSeriesTopRatedError extends TvSeriesTopRatedState {
  final String message;

  TvSeriesTopRatedError(this.message);

  @override
  List<Object?> get props => [message];
}

class TvSeriesTopRatedHasData extends TvSeriesTopRatedState {
  final List<TvSeries> result;

  TvSeriesTopRatedHasData(this.result);

  @override
  List<Object?> get props => [];
}