part of 'tv_series_list_bloc.dart';

@immutable
abstract class TvSeriesListEvent extends Equatable {}

class OnTvSeriesListCalled extends TvSeriesListEvent {
  @override
  List<Object?> get props => [];
}