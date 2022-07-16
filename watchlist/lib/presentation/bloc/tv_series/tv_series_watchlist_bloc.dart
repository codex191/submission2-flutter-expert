import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:watchlist/watchlist.dart';

part 'tv_series_watchlist_event.dart';
part 'tv_series_watchlist_state.dart';

class TvSeriesWatchlistBloc extends Bloc<TvSeriesWatchlistEvent, TvSeriesWatchlistState> {
  static const watchlistAddSuccessMessage = 'Added to Watchlist';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  final GetWatchListTvSeries _getWatchlistTvShows;
  final GetTvSeriesWatchListStatus _getWatchlistTvStatus;
  final RemoveTvSeriesWatchlist _removeTvSeriesWatchlist;
  final SaveTvSeriesWatchlist _saveTvWatchList;

  TvSeriesWatchlistBloc(
    this._getWatchlistTvShows,
    this._getWatchlistTvStatus,
    this._saveTvWatchList,
    this._removeTvSeriesWatchlist,
  ) : super(TvSeriesWatchlistInitial()) {
    on<OnFetchTvSeriesWatchlist>(_onFetchTvSeriesWatchlist);
    on<FetchTvSeriesWatchlistStatus>(_fetchTvSeriesWatchlistStatus);
    on<AddTvSeriesToWatchlist>(_addTvSeriesToWatchlist);
    on<RemoveTvSeriesFromWatchlist>(_remoteTvSeriesFromWatchlist);
  }

  FutureOr<void> _onFetchTvSeriesWatchlist(
    OnFetchTvSeriesWatchlist event,
    Emitter<TvSeriesWatchlistState> emit,
  ) async {
    emit(TvSeriesWatchlistLoading());

    final result = await _getWatchlistTvShows.execute();

    result.fold(
      (failure) {
        emit(TvSeriesWatchlistError(failure.message));
      },
      (data) {
        data.isEmpty
            ? emit(TvSeriesWatchlistEmpty())
            : emit(TvSeriesWatchlistHasData(data));
      },
    );
  }

  FutureOr<void> _fetchTvSeriesWatchlistStatus(
    FetchTvSeriesWatchlistStatus event,
    Emitter<TvSeriesWatchlistState> emit,
  ) async {
    final id = event.id;

    final result = await _getWatchlistTvStatus.execute(id);

    emit(TvSeriesIsAddedToWatchlist(result));
  }

  FutureOr<void> _addTvSeriesToWatchlist(
    AddTvSeriesToWatchlist event,
    Emitter<TvSeriesWatchlistState> emit,
  ) async {
    final tv = event.tv;

    final result = await _saveTvWatchList.execute(tv);

    result.fold(
      (failure) {
        emit(TvSeriesWatchlistError(failure.message));
      },
      (message) {
        emit(TvSeriesWatchlistMessage(message));
      },
    );
  }

  FutureOr<void> _remoteTvSeriesFromWatchlist(
    RemoveTvSeriesFromWatchlist event,
    Emitter<TvSeriesWatchlistState> emit,
  ) async {
    final tv = event.tv;

    final result = await _removeTvSeriesWatchlist.execute(tv);

    result.fold(
      (failure) {
        emit(TvSeriesWatchlistError(failure.message));
      },
      (message) {
        emit(TvSeriesWatchlistMessage(message));
      },
    );
  }
}