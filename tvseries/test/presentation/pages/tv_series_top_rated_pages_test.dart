import 'package:tvseries/tvseries.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/page_helper_test.dart';

void main() {
  late FakeTvSeriesTopRatedBloc fakeBloc;

  setUp(() {
    registerFallbackValue(FakeTvSeriesTopRatedEvent());
    registerFallbackValue(FakeTvSeriesTopRatedState());
    fakeBloc = FakeTvSeriesTopRatedBloc();
  });

  Widget _createTestableWidget(Widget body) {
    return BlocProvider<TvSeriesTopRatedBloc>(
      create: (context) => fakeBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(() => fakeBloc.state).thenReturn(TvSeriesTopRatedLoading());

    final progressBarFinder = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);

    await tester
        .pumpWidget(_createTestableWidget( TopRatedTvSeriesPage()));

    expect(centerFinder, findsOneWidget);
    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded',
      (WidgetTester tester) async {
    when(() => fakeBloc.state)
        .thenReturn(TvSeriesTopRatedHasData(testTvSeriesList));

    final listViewFinder = find.byType(ListView);

    await tester
        .pumpWidget(_createTestableWidget(TopRatedTvSeriesPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    when(() => fakeBloc.state).thenReturn(TvSeriesTopRatedError('error'));

    final textFinder = find.byKey(const Key('error_message'));

    await tester
        .pumpWidget(_createTestableWidget(TopRatedTvSeriesPage()));

    expect(textFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when empty',
      (WidgetTester tester) async {
    when(() => fakeBloc.state).thenReturn(TvSeriesTopRatedEmpty());

    final textFinder = find.byKey(const Key('empty_message'));

    await tester
        .pumpWidget(_createTestableWidget(TopRatedTvSeriesPage()));

    expect(textFinder, findsOneWidget);
  });
}