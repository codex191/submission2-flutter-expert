import 'package:dartz/dartz.dart';
import 'package:core/core.dart';
import 'package:tvseries/tvseries.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';

import '../../dummy_data/dummy_objects.dart';
import 'tv_series_list_bloc_test.mocks.dart';

@GenerateMocks([
  GetNowPlayingTvSeries,
  GetPopularTv,
  GetTopRatedTvSeries,
])
void main() {
  late MockGetNowPlayingTvSeries mockGetNowPlayingTvSeries;
  late TvSeriesListBloc tvsBloc;

  setUp(() {
    mockGetNowPlayingTvSeries = MockGetNowPlayingTvSeries();
    tvsBloc = TvSeriesListBloc(mockGetNowPlayingTvSeries);
  });

  test('initial state should be empty', () {
    expect(tvsBloc.state, TvSeriesListEmpty());
  });

  blocTest<TvSeriesListBloc, TvSeriesListState>(
    'emit loading and hasdata when success',
    build: () {
      when(mockGetNowPlayingTvSeries.execute())
          .thenAnswer((_) async => Right(testTvSeriesList));
      return tvsBloc;
    },
    act: (blocAct) => blocAct.add(OnTvSeriesListCalled()),
    expect: () => [
      TvSeriesListLoading(),
      TvSeriesListHasData(testTvSeriesList),
    ],
    verify: (blocAct) {
      verify(mockGetNowPlayingTvSeries.execute());
      return OnTvSeriesListCalled().props;
    },
  );

  blocTest<TvSeriesListBloc, TvSeriesListState>(
    'emit loading and error when unsuccess',
    build: () {
      when(mockGetNowPlayingTvSeries.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return tvsBloc;
    },
    act: (blocAct) => blocAct.add(OnTvSeriesListCalled()),
    expect: () => [
      TvSeriesListLoading(),
      TvSeriesListError('Server Failure'),
    ],
    verify: (blocAct) => TvSeriesListLoading(),
  );

  blocTest<TvSeriesListBloc, TvSeriesListState>(
    'emit loading and empty when unsuccess',
    build: () {
      when(mockGetNowPlayingTvSeries.execute())
          .thenAnswer((_) async => const Right([]));
      return tvsBloc;
    },
    act: (blocAct) => blocAct.add(OnTvSeriesListCalled()),
    expect: () => [
      TvSeriesListLoading(),
      TvSeriesListEmpty(),
    ],
  );
}