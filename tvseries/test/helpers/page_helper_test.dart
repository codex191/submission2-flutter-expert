import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tvseries/tvseries.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:watchlist/watchlist.dart';

void main() {
  setUp(() {
    registerFallbackValue(FakeTvSeriesListEvent());
    registerFallbackValue(FakeTvSeriesListState());
    registerFallbackValue(FakeTvSeriesPopularEvent());
    registerFallbackValue(FakeTvSeriesPopularState());
    registerFallbackValue(FakeTvSeriesTopRatedEvent());
    registerFallbackValue(FakeTvSeriesTopRatedState());
    TestWidgetsFlutterBinding.ensureInitialized();
  });
}

class FakeTvSeriesListEvent extends Fake implements TvSeriesListEvent {}
class FakeTvSeriesListState extends Fake implements TvSeriesListState {}
class FakeTvSeriesListBloc extends MockBloc<TvSeriesListEvent, TvSeriesListState> implements TvSeriesListBloc {}

class FakeTvSeriesPopularEvent extends Fake implements TvSeriesPopularEvent {}
class FakeTvSeriesPopularState extends Fake implements TvSeriesPopularState {}
class FakeTvSeriesPopularBloc extends MockBloc<TvSeriesPopularEvent, TvSeriesPopularState> implements TvSeriesPopularBloc {}

class FakeTvSeriesRecommendationEvent extends Fake implements TvSeriesRecommendationEvent {}
class FakeTvSeriesRecommendatioState extends Fake implements TvSeriesRecommendationState {}
class FakeTvSeriesRecommendatioBloc extends MockBloc<TvSeriesRecommendationEvent, TvSeriesRecommendationState> implements TvSeriesRecommendationBloc {}

class FakeTvSeriesTopRatedEvent extends Fake implements TvSeriesTopRatedEvent {}
class FakeTvSeriesTopRatedState extends Fake implements TvSeriesTopRatedState {}
class FakeTvSeriesTopRatedBloc extends MockBloc<TvSeriesTopRatedEvent, TvSeriesTopRatedState> implements TvSeriesTopRatedBloc {}

class FakeTvSeriesDetailEvent extends Fake implements TvSeriesDetailEvent {}
class FakeTvSeriesDetailState extends Fake implements TvSeriesDetailState {}
class FakeTvSeriesDetailBloc extends MockBloc<TvSeriesDetailEvent, TvSeriesDetailState> implements TvSeriesDetailBloc {}

class FakeTvSeriesWatchlistEvent extends Fake implements TvSeriesWatchlistEvent {}
class FakeTvSeriesWatchlistState extends Fake implements TvSeriesWatchlistState {}
class FakeTvSeriesWatchlistBloc extends MockBloc<TvSeriesWatchlistEvent, TvSeriesWatchlistState> implements TvSeriesWatchlistBloc {}
