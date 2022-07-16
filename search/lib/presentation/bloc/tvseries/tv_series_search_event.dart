part of 'tv_series_search_bloc.dart';

@immutable
abstract class SearchTvSeriesEvent extends Equatable {}

class OnQueryTvSeriesChange extends SearchTvSeriesEvent {
  final String query;

  OnQueryTvSeriesChange(this.query);

  @override
  List<Object> get props => [query];
}