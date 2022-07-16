part of 'tv_series_recommendation_bloc.dart';

@immutable
abstract class TvSeriesRecommendationEvent extends Equatable {}

class OnTvSeriesRecommendationCalled extends TvSeriesRecommendationEvent {
  final int id;

  OnTvSeriesRecommendationCalled(this.id);

  @override
  List<Object?> get props => [id];
}