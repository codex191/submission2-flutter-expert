import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tvseries/tvseries.dart';
import 'package:flutter/material.dart';

import '../../helpers/page_helper_test.dart';
import '../../dummy_data/dummy_objects.dart';

void main() {
  late FakeTvSeriesListBloc fakeTVSeriesListBloc;
  late FakeTvSeriesPopularBloc fakeTVSeriesPopularBloc;
  late FakeTvSeriesTopBloc fakeTVSeriesTopBloc;

  setUp(() {
    registerFallbackValue(FakeTvSeriesListEvent());
    registerFallbackValue(FakeTvSeriesListState());
    fakeTVSeriesListBloc = FakeTvSeriesListBloc();

    registerFallbackValue(FakeTvSeriesPopularEvent());
    registerFallbackValue(FakeTvSeriesPopularState());
    fakeTVSeriesPopularBloc = FakeTvSeriesPopularBloc();

    registerFallbackValue(FakeTvSeriesTopEvent());
    registerFallbackValue(FakeTvSeriesTopState());
    fakeTVSeriesTopBloc = FakeTvSeriesTopBloc();

    TestWidgetsFlutterBinding.ensureInitialized();
  });

  Widget _createTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TvSeriesListBloc>(
          create: (context) => fakeTVSeriesListBloc,
        ),
        BlocProvider<TvSeriesPopularBloc>(
          create: (context) => fakeTVSeriesPopularBloc,
        ),
        BlocProvider<TvSeriesTopRatedBloc>(
          create: (context) => fakeTVSeriesTopBloc,
        ),
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display center progress bar when loading',
      (tester) async {
    when(() => fakeTVSeriesListBloc.state).thenReturn(TvSeriesListLoading());
    when(() => fakeTVSeriesPopularBloc.state)
        .thenReturn(TvSeriesPopularLoading());
    when(() => fakeTVSeriesTopBloc.state).thenReturn(TvSeriesTopRatedLoading());

    final progressBarFinder = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(_createTestableWidget( HomeTvSeriesPage()));

    expect(progressBarFinder, findsNWidgets(3));
  });

  testWidgets('Page should display listview tvlist when hasdata',
      (tester) async {
    when(() => fakeTVSeriesListBloc.state)
        .thenReturn(TvSeriesListHasData(testTvSeriesList));
    when(() => fakeTVSeriesPopularBloc.state)
        .thenReturn(TvSeriesPopularHasData(testTvSeriesList));
    when(() => fakeTVSeriesTopBloc.state)
        .thenReturn(TvSeriesTopRatedHasData(testTvSeriesList));

    final listViewFinder = find.byType(ListView);
    final tvListFinder = find.byType(TvList);

    await tester.pumpWidget(_createTestableWidget( HomeTvSeriesPage()));

    expect(listViewFinder, findsNWidgets(3));
    expect(tvListFinder, findsNWidgets(3));
  });

  testWidgets('Page should display error text when error', (tester) async {
    when(() => fakeTVSeriesListBloc.state)
        .thenReturn(TvSeriesListError('error'));
    when(() => fakeTVSeriesPopularBloc.state)
        .thenReturn(TvSeriesPopularError('error'));
    when(() => fakeTVSeriesTopBloc.state)
        .thenReturn(TvSeriesTopRatedError('error'));

    await tester.pumpWidget(_createTestableWidget( HomeTvSeriesPage()));

    expect(find.byKey(const Key('error_message')), findsNWidgets(3));
  });

  testWidgets('Page should display empty text when empty', (tester) async {
    when(() => fakeTVSeriesListBloc.state).thenReturn(TvSeriesListEmpty());
    when(() => fakeTVSeriesPopularBloc.state)
        .thenReturn(TvSeriesPopularEmpty());
    when(() => fakeTVSeriesTopBloc.state).thenReturn(TvSeriesTopRatedEmpty());

    await tester.pumpWidget(_createTestableWidget( HomeTvSeriesPage()));

    expect(find.byKey(const Key('empty_message')), findsNWidgets(3));
  });
}