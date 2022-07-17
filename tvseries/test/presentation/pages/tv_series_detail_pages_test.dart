import 'package:tvseries/tvseries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:watchlist/watchlist.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/page_helper_test.dart';
import '../../dummy_data/dummy_objects.dart';

void main() {
  late FakeTvSeriesDetailBloc fakeTvSeriesBloc;
  late FakeTvSeriesWatchlistBloc fakeWatchlistBloc;
  late FakeTvSeriesRecomBloc fakeRecommendationBloc;

  setUpAll(() {
    registerFallbackValue(FakeTvSeriesDetailEvent());
    registerFallbackValue(FakeTvSeriesDetailState());
    fakeTvSeriesBloc = FakeTvSeriesDetailBloc();

    registerFallbackValue(FakeTvSeriesWatchlistEvent());
    registerFallbackValue(FakeTvSeriesWatchlistState());
    fakeWatchlistBloc = FakeTvSeriesWatchlistBloc();

    registerFallbackValue(FakeTvSeriesRecomEvent());
    registerFallbackValue(FakeTvSeriesRecomState());
    fakeRecommendationBloc = FakeTvSeriesRecomBloc();
  });

  Widget _makeTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TvSeriesDetailBloc>(
          create: (context) => fakeTvSeriesBloc,
        ),
        BlocProvider<TvSeriesWatchlistBloc>(
          create: (context) => fakeWatchlistBloc,
        ),
        BlocProvider<TvSeriesRecommendationBloc>(
          create: (context) => fakeRecommendationBloc,
        ),
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  Widget _makeAnotherTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TvSeriesDetailBloc>(
          create: (context) => fakeTvSeriesBloc,
        ),
        BlocProvider<TvSeriesWatchlistBloc>(
          create: (context) => fakeWatchlistBloc,
        ),
        BlocProvider<TvSeriesRecommendationBloc>(
          create: (context) => fakeRecommendationBloc,
        ),
      ],
      child: body,
    );
  }

  // ignore: unused_local_variable
  final routes = <String, WidgetBuilder>{
    '/': (context) => const FakeHome(),
    '/next': (context) =>
        _makeAnotherTestableWidget(TvSeriesDetailPage(id: 1)),
    TvSeriesDetailPage.ROUTE_NAME: (context) => const FakeDestination(),
  };

  testWidgets('should show circular progress when TV detail is loading',
      (tester) async {
    when(() => fakeTvSeriesBloc.state).thenReturn(TvSeriesDetailLoading());
    when(() => fakeRecommendationBloc.state).thenReturn(TvSeriesRecommendationLoading());

    when(() => fakeWatchlistBloc.state)
        .thenReturn(TvSeriesIsAddedToWatchlist(false));

    await tester.pumpWidget(
        _makeTestableWidget(TvSeriesDetailPage(id: testTvSeriesDetail.id)));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('should show error message progress when TV detail is error',
      (tester) async {
    when(() => fakeTvSeriesBloc.state).thenReturn(TvSeriesDetailError('error'));
    when(() => fakeRecommendationBloc.state).thenReturn(TvSeriesRecommendationLoading());
    when(() => fakeWatchlistBloc.state)
        .thenReturn(TvSeriesIsAddedToWatchlist(false));

    await tester.pumpWidget(
        _makeTestableWidget(TvSeriesDetailPage(id: testTvSeriesDetail.id)));

    expect(find.byKey(const Key('error_message')), findsOneWidget);
  });

  testWidgets('should show empty message progress when TV detail is empty',
      (tester) async {
    when(() => fakeTvSeriesBloc.state).thenReturn(TvSeriesDetailEmpty());
    when(() => fakeRecommendationBloc.state).thenReturn(TvSeriesRecommendationLoading());
    when(() => fakeWatchlistBloc.state).thenReturn(TvSeriesIsAddedToWatchlist(false));

    await tester.pumpWidget(
        _makeTestableWidget(TvSeriesDetailPage(id: testTvSeriesDetail.id)));

    expect(find.byKey(const Key('empty_message')), findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display add icon when TV not added to watchlist',
      (WidgetTester tester) async {
    when(() => fakeTvSeriesBloc.state).thenReturn(TvSeriesDetailHasData(testTvSeriesDetail));
    when(() => fakeRecommendationBloc.state).thenReturn(TvSeriesRecommendationHasData(testTvSeriesList));
    when(() => fakeWatchlistBloc.state).thenReturn(TvSeriesIsAddedToWatchlist(false));

    final watchlistButtonIcon = find.byIcon(Icons.add);

    await tester.pumpWidget(
        _makeTestableWidget(TvSeriesDetailPage(id: testTvSeriesDetail.id)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should dispay check icon when TV is added to wathclist',
      (WidgetTester tester) async {
    when(() => fakeTvSeriesBloc.state).thenReturn(TvSeriesDetailHasData(testTvSeriesDetail));
    when(() => fakeRecommendationBloc.state).thenReturn(TvSeriesRecommendationHasData(testTvSeriesList));
    when(() => fakeWatchlistBloc.state).thenReturn(TvSeriesIsAddedToWatchlist(true));

    final watchlistButtonIcon = find.byIcon(Icons.check);

    await tester.pumpWidget(
        _makeTestableWidget(TvSeriesDetailPage(id: testTvSeriesDetail.id)));

    expect(watchlistButtonIcon, findsOneWidget);
  });
}