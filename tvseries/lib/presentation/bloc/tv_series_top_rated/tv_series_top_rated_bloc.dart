import 'dart:async';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:tvseries/tvseries.dart';

part 'tv_series_top_rated_event.dart';
part 'tv_series_top_rated_state.dart';

class TvSeriesTopRatedBloc
    extends Bloc<TvSeriesTopRatedEvent, TvSeriesTopRatedState> {
  final GetTopRatedTvSeries _getTopRatedTvShows;

  TvSeriesTopRatedBloc(
    this._getTopRatedTvShows,
  ) : super(TvSeriesTopRatedEmpty()) {
    on<OnTvSeriesTopRatedCalled>(_onTvSeriesTopRatedCalled);
  }

  FutureOr<void> _onTvSeriesTopRatedCalled(
    OnTvSeriesTopRatedCalled event,
    Emitter<TvSeriesTopRatedState> emit,
  ) async {
    emit(TvSeriesTopRatedLoading());

    final result = await _getTopRatedTvShows.execute();

    result.fold(
      (failure) {
        emit(TvSeriesTopRatedError(failure.message));
      },
      (data) {
        data.isEmpty
            ? emit(TvSeriesTopRatedEmpty())
            : emit(TvSeriesTopRatedHasData(data));
      },
    );
  }
}