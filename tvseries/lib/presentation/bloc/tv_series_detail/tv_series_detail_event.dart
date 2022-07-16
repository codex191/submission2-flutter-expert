part of 'tv_series_detail_bloc.dart';

@immutable
abstract class TvSeriesDetailEvent extends Equatable {}

class OnTvSeriesDetailCalled extends TvSeriesDetailEvent {
  final int id;

  OnTvSeriesDetailCalled(this.id);

  @override
  List<Object?> get props => [id];
}