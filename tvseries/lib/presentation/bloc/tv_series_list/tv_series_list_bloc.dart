import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:tvseries/tvseries.dart';

part 'tv_series_list_event.dart';
part 'tv_series_list_state.dart';

class TvSeriesListBloc extends Bloc<TvSeriesListEvent, TvSeriesListState> {
  final GetNowPlayingTvSeries _getNowPlayingTvSeries;

  TvSeriesListBloc(this._getNowPlayingTvSeries) : super(TvSeriesListEmpty()) {
    on<OnTvSeriesListCalled>(_onTVSeriesListCalled);
  }

  FutureOr<void> _onTVSeriesListCalled(
      OnTvSeriesListCalled event, Emitter<TvSeriesListState> emit) async {
    emit(TvSeriesListLoading());

    final result = await _getNowPlayingTvSeries.execute();

    result.fold(
      (failure) {
        emit(TvSeriesListError(failure.message));
      },
      (data) {
        data.isEmpty
            ? emit(TvSeriesListEmpty())
            : emit(TvSeriesListHasData(data));
      },
    );
  }
}