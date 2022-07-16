import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:tvseries/tvseries.dart';

part 'tv_series_recommendation_event.dart';
part 'tv_series_recommendation_state.dart';

class TvSeriesRecommendationBloc
    extends Bloc<TvSeriesRecommendationEvent, TvSeriesRecommendationState> {
  final GetTvSeriesRecommendations _getTvRecommendations;

  TvSeriesRecommendationBloc(this._getTvRecommendations)
      : super(TvSeriesRecommendationEmpty()) {
    on<OnTvSeriesRecommendationCalled>(_onTvSeriesRecommendationCalled);
  }

  FutureOr<void> _onTvSeriesRecommendationCalled(
    OnTvSeriesRecommendationCalled event,
    Emitter<TvSeriesRecommendationState> emit,
  ) async {
    final id = event.id;
    emit(TvSeriesRecommendationLoading());

    final result = await _getTvRecommendations.execute(id);

    result.fold(
      (failure) {
        emit(TvSeriesRecommendationError(failure.message));
      },
      (data) {
        data.isEmpty
            ? emit(TvSeriesRecommendationEmpty())
            : emit(TvSeriesRecommendationHasData(data));
      },
    );
  }
}