import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:tvseries/tvseries.dart';

part 'tv_series_popular_event.dart';
part 'tv_series_popular_state.dart';

class TvSeriesPopularBloc
    extends Bloc<TvSeriesPopularEvent, TvSeriesPopularState> {
  final GetPopularTv _getPopularTvShows;

  TvSeriesPopularBloc(
    this._getPopularTvShows,
  ) : super(TvSeriesPopularEmpty()) {
    on<OnTvSeriesPopularCalled>(_onTvSeriesPopularCalled);
  }

  FutureOr<void> _onTvSeriesPopularCalled(
    OnTvSeriesPopularCalled event,
    Emitter<TvSeriesPopularState> emit,
  ) async {
    emit(TvSeriesPopularLoading());

    final result = await _getPopularTvShows.execute();

    result.fold(
      (failure) {
        emit(TvSeriesPopularError(failure.message));
      },
      (data) {
        data.isEmpty
            ? emit(TvSeriesPopularEmpty())
            : emit(TvSeriesPopularHasData(data));
      },
    );
  }
}