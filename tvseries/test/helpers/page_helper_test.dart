import 'package:flutter/material.dart';
import 'package:tvseries/tvseries.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:watchlist/watchlist.dart';

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


class FakeTvSeriesListEvent extends Fake implements TvSeriesListEvent {}

class FakeTvSeriesListState extends Fake implements TvSeriesListState {}

class FakeTvSeriesListBloc
    extends MockBloc<TvSeriesListEvent, TvSeriesListState>
    implements TvSeriesListBloc {}


class FakeTvSeriesPopularEvent extends Fake implements TvSeriesPopularEvent {}

class FakeTvSeriesPopularState extends Fake implements TvSeriesPopularState {}

class FakeTvSeriesPopularBloc
    extends MockBloc<TvSeriesPopularEvent, TvSeriesPopularState>
    implements TvSeriesPopularBloc {}

class FakeTvSeriesRecomEvent extends Fake
    implements TvSeriesRecommendationEvent {}

class FakeTvSeriesRecomState extends Fake
    implements TvSeriesRecommendationState {}

class FakeTvSeriesRecomBloc
    extends MockBloc<TvSeriesRecommendationEvent, TvSeriesRecommendationState>
    implements TvSeriesRecommendationBloc {}
class FakeTvSeriesTopEvent extends Fake implements TvSeriesTopRatedEvent {}

class FakeTvSeriesTopState extends Fake implements TvSeriesTopRatedState {}

class FakeTvSeriesTopBloc
    extends MockBloc<TvSeriesTopRatedEvent, TvSeriesTopRatedState>
    implements TvSeriesTopRatedBloc {}

class FakeTvSeriesDetailEvent extends Fake implements TvSeriesDetailEvent {}

class FakeTvSeriesDetailState extends Fake implements TvSeriesDetailState {}

class FakeTvSeriesDetailBloc
    extends MockBloc<TvSeriesDetailEvent, TvSeriesDetailState>
    implements TvSeriesDetailBloc {}

class FakeTvSeriesWatchlistEvent extends Fake
    implements TvSeriesWatchlistEvent {}

class FakeTvSeriesWatchlistState extends Fake
    implements TvSeriesWatchlistState {}

class FakeTvSeriesWatchlistBloc
    extends MockBloc<TvSeriesWatchlistEvent, TvSeriesWatchlistState>
    implements TvSeriesWatchlistBloc {}
