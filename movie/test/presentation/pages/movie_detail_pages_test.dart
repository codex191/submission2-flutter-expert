import 'package:core/core.dart';
import 'package:movie/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlist/watchlist.dart';
// ignore: depend_on_referenced_packages
import 'package:mocktail/mocktail.dart';
import '../../dummy_data/dummy_objects.dart';
import '.././../helpers/test_page_helper.dart';
// ignore: unused_import
import 'movie_detail_pages_test.mocks.dart';

@GenerateMocks([MovieDetailBloc])
void main() {
  late FakeMovieDetailBloc fakeMovieBloc;
  late FakeMovieWatchlistBloc fakeWatchlistBloc;
  late FakeRecommendationMovieBloc fakeRecommendationMovieBloc;

  setUpAll(() {
    registerFallbackValue(FakeMovieDetailEvent());
    registerFallbackValue(FakeMovieDetailState());
    fakeMovieBloc = FakeMovieDetailBloc();

    registerFallbackValue(FakeMovieWatchlistEvent());
    registerFallbackValue(FakeMovieWatchlistState());
    fakeWatchlistBloc = FakeMovieWatchlistBloc();

    registerFallbackValue(FakeRecommendationMovieEvent());
    registerFallbackValue(FakeRecommendationMovieState());
    fakeRecommendationMovieBloc = FakeRecommendationMovieBloc();
  });

  Widget _makeTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieDetailBloc>(
          create: (context) => fakeMovieBloc,
        ),
        BlocProvider<MovieWatchlistBloc>(
          create: (context) => fakeWatchlistBloc,
        ),
        BlocProvider<MovieRecommendationBloc>(
          create: (context) => fakeRecommendationMovieBloc,
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
        BlocProvider<MovieDetailBloc>(
          create: (context) => fakeMovieBloc,
        ),
        BlocProvider<MovieWatchlistBloc>(
          create: (context) => fakeWatchlistBloc,
        ),
        BlocProvider<MovieRecommendationBloc>(
          create: (context) => fakeRecommendationMovieBloc,
        ),
      ],
      child: body,
    );
  }

  final routes = <String, WidgetBuilder>{
    '/': (context) => const FakeHome(),
    '/next': (context) => _makeAnotherTestableWidget( MovieDetailPage(
          id: 1,
        )),
    MovieDetailPage.ROUTE_NAME: (context) => const FakeDestination(),
  };

  testWidgets('should show circular progress when movie detail is loading',
      (tester) async {
    when(() => fakeMovieBloc.state).thenReturn(MovieDetailLoading());
    when(() => fakeRecommendationMovieBloc.state)
        .thenReturn(MovieRecommendationLoading());
    when(() => fakeWatchlistBloc.state)
        .thenReturn(MovieIsAddedToWatchlist(false));

    await tester.pumpWidget(
        _makeTestableWidget(MovieDetailPage(id: testMovieDetail.id)));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('should show error message progress when movie detail is error',
      (tester) async {
    when(() => fakeMovieBloc.state).thenReturn(MovieDetailError('error'));
    when(() => fakeRecommendationMovieBloc.state)
        .thenReturn(MovieRecommendationLoading());
    when(() => fakeWatchlistBloc.state)
        .thenReturn(MovieIsAddedToWatchlist(false));

    await tester.pumpWidget(
        _makeTestableWidget(MovieDetailPage(id: testMovieDetail.id)));

    expect(find.byKey(const Key('error_message')), findsOneWidget);
  });

  testWidgets('should show empty message progress when movie detail is empty',
      (tester) async {
    when(() => fakeMovieBloc.state).thenReturn(MovieDetailEmpty());
    when(() => fakeRecommendationMovieBloc.state)
        .thenReturn(MovieRecommendationLoading());
    when(() => fakeWatchlistBloc.state)
        .thenReturn(MovieIsAddedToWatchlist(false));

    await tester.pumpWidget(
        _makeTestableWidget(MovieDetailPage(id: testMovieDetail.id)));

    expect(find.byKey(const Key('empty_message')), findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display add icon when movie not added to watchlist',
      (WidgetTester tester) async {
    when(() => fakeMovieBloc.state)
        .thenReturn(MovieDetailHasData(testMovieDetail));
    when(() => fakeRecommendationMovieBloc.state)
        .thenReturn(MovieRecommendationHasData(testMovieList));
    when(() => fakeWatchlistBloc.state)
        .thenReturn(MovieIsAddedToWatchlist(false));

    final watchlistButtonIcon = find.byIcon(Icons.add);

    await tester.pumpWidget(
        _makeTestableWidget(MovieDetailPage(id: testMovieDetail.id)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should dispay check icon when movie is added to wathclist',
      (WidgetTester tester) async {
    when(() => fakeMovieBloc.state)
        .thenReturn(MovieDetailHasData(testMovieDetail));
    when(() => fakeRecommendationMovieBloc.state)
        .thenReturn(MovieRecommendationHasData(testMovieList));
    when(() => fakeWatchlistBloc.state)
        .thenReturn(MovieIsAddedToWatchlist(true));

    final watchlistButtonIcon = find.byIcon(Icons.check);

    await tester.pumpWidget(
        _makeTestableWidget(MovieDetailPage(id: testMovieDetail.id)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets('should show circular progress when movie recom is loading',
      (tester) async {
    when(() => fakeMovieBloc.state)
        .thenReturn(MovieDetailHasData(testMovieDetail));
    when(() => fakeRecommendationMovieBloc.state)
        .thenReturn(MovieRecommendationLoading());
    when(() => fakeWatchlistBloc.state)
        .thenReturn(MovieIsAddedToWatchlist(false));

    await tester.pumpWidget(
        _makeTestableWidget(MovieDetailPage(id: testMovieDetail.id)));

    expect(find.byType(CircularProgressIndicator), findsNWidgets(2));
  });

  testWidgets('should show ListView ClipRReact when movie recom is has data',
      (tester) async {
    when(() => fakeMovieBloc.state)
        .thenReturn(MovieDetailHasData(testMovieDetail));
    when(() => fakeRecommendationMovieBloc.state)
        .thenReturn(MovieRecommendationHasData(testMovieList));
    when(() => fakeWatchlistBloc.state)
        .thenReturn(MovieIsAddedToWatchlist(false));

    await tester.pumpWidget(
        _makeTestableWidget(MovieDetailPage(id: testMovieDetail.id)));

    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(ClipRRect), findsOneWidget);
  });
}

class FakeHome extends StatelessWidget {
  const FakeHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListTile(
        key: const Key('fakeHome'),
        onTap: () {
          Navigator.pushNamed(context, '/next');
        },
      ),
      appBar: AppBar(
        title: const Text('fakeHome'),
        leading: const Icon(Icons.menu),
      ),
    );
  }
}

class FakeDestination extends StatelessWidget {
  const FakeDestination({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListTile(
        key: const Key('fakeDestination'),
        onTap: () {
          Navigator.pop(context);
        },
        title: const Text('fake Destination'),
        leading: const Icon(Icons.check),
      ),
    );
  }
}

MaterialApp testableMaterialApp(routes, page) {
  return MaterialApp(
    theme: ThemeData.dark().copyWith(
      colorScheme: kColorScheme,
      primaryColor: kRichBlack,
      scaffoldBackgroundColor: kRichBlack,
      textTheme: kTextTheme,
    ),
    home: page,
  );
}