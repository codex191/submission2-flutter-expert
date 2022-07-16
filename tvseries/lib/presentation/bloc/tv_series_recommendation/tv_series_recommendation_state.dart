part of 'tv_series_recommendation_bloc.dart';

@immutable
abstract class TvSeriesRecommendationState extends Equatable {}

class TvSeriesRecommendationEmpty extends TvSeriesRecommendationState {
  @override
  List<Object?> get props => [];
}

class TvSeriesRecommendationLoading extends TvSeriesRecommendationState {
  @override
  List<Object?> get props => [];
}

class TvSeriesRecommendationError extends TvSeriesRecommendationState {
  final String message;

  TvSeriesRecommendationError(this.message);

  @override
  List<Object?> get props => [message];
}

class TvSeriesRecommendationHasData extends TvSeriesRecommendationState {
  final List<TvSeries> result;

  TvSeriesRecommendationHasData(this.result);

  @override
  List<Object?> get props => [];
}