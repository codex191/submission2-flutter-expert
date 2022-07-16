part of 'tv_series_watchlist_bloc.dart';

@immutable
abstract class TvSeriesWatchlistEvent extends Equatable {}

class OnFetchTvSeriesWatchlist extends TvSeriesWatchlistEvent {
  @override
  List<Object> get props => [];
}

class FetchTvSeriesWatchlistStatus extends TvSeriesWatchlistEvent {
  final int id;

  FetchTvSeriesWatchlistStatus(this.id);

  @override
  List<Object> get props => [id];
}

class AddTvSeriesToWatchlist extends TvSeriesWatchlistEvent {
  final TvSeriesDetail tv;

  AddTvSeriesToWatchlist(this.tv);

  @override
  List<Object> get props => [tv];
}

class RemoveTvSeriesFromWatchlist extends TvSeriesWatchlistEvent {
  final TvSeriesDetail tv;

  RemoveTvSeriesFromWatchlist(this.tv);

  @override
  List<Object> get props => [tv];
}