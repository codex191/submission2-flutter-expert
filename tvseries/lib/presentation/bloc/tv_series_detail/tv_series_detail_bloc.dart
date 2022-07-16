import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:tvseries/tvseries.dart';

part 'tv_series_detail_event.dart';
part 'tv_series_detail_state.dart';

class TvSeriesDetailBloc
    extends Bloc<TvSeriesDetailEvent, TvSeriesDetailState> {
  final GetTvSeriesDetail _getTvSeriesDetail;

  TvSeriesDetailBloc(
    this._getTvSeriesDetail,
  ) : super(TvSeriesDetailEmpty()) {
    on<OnTvSeriesDetailCalled>(_onTvSeriesDetailCalled);
  }

  FutureOr<void> _onTvSeriesDetailCalled(
    OnTvSeriesDetailCalled event,
    Emitter<TvSeriesDetailState> emit,
  ) async {
    final id = event.id;
    emit(TvSeriesDetailLoading());

    final result = await _getTvSeriesDetail.execute(id);

    result.fold(
      (failure) {
        emit(TvSeriesDetailError(failure.message));
      },
      (data) {
        emit(TvSeriesDetailHasData(data));
      },
    );
  }
}