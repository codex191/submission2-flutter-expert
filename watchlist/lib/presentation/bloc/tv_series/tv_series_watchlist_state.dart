part of 'tv_series_watchlist_bloc.dart';

@immutable
abstract class TvSeriesWatchlistState extends Equatable {}

class TvSeriesWatchlistInitial extends TvSeriesWatchlistState {
  @override
  List<Object> get props => [];
}

class TvSeriesWatchlistEmpty extends TvSeriesWatchlistState {
  @override
  List<Object> get props => [];
}

class TvSeriesWatchlistLoading extends TvSeriesWatchlistState {
  @override
  List<Object> get props => [];
}

class TvSeriesWatchlistError extends TvSeriesWatchlistState {
  final String message;

  TvSeriesWatchlistError(this.message);

  @override
  List<Object> get props => [message];
}

class TvSeriesWatchlistHasData extends TvSeriesWatchlistState {
  final List<TvSeries> result;

  TvSeriesWatchlistHasData(this.result);

  @override
  List<Object> get props => [result];
}

class TvSeriesIsAddedToWatchlist extends TvSeriesWatchlistState {
  final bool isAdded;

  TvSeriesIsAddedToWatchlist(this.isAdded);

  @override
  List<Object> get props => [isAdded];
}

class TvSeriesWatchlistMessage extends TvSeriesWatchlistState {
  final String message;

  TvSeriesWatchlistMessage(this.message);

  @override
  List<Object> get props => [message];
}