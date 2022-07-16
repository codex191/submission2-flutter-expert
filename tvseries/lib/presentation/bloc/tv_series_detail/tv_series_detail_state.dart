part of 'tv_series_detail_bloc.dart';

@immutable
abstract class TvSeriesDetailState extends Equatable {}

class TvSeriesDetailEmpty extends TvSeriesDetailState {
  @override
  List<Object?> get props => [];
}

class TvSeriesDetailLoading extends TvSeriesDetailState {
  @override
  List<Object?> get props => [];
}

class TvSeriesDetailError extends TvSeriesDetailState {
  final String message;

  TvSeriesDetailError(this.message);

  @override
  List<Object?> get props => [message];
}

class TvSeriesDetailHasData extends TvSeriesDetailState {
  final TvSeriesDetail result;

  TvSeriesDetailHasData(this.result);

  @override
  List<Object?> get props => [result];
}