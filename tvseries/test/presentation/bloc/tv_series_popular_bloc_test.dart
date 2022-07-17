import 'package:dartz/dartz.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:tvseries/tvseries.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'tv_series_popular_bloc_test.mocks.dart';

@GenerateMocks([GetPopularTv])
void main() {
  late MockGetPopularTv mockGetPopularTvSeries;
  late TvSeriesPopularBloc tvseriesBloc;

  setUp(() {
    mockGetPopularTvSeries = MockGetPopularTv();
    tvseriesBloc = TvSeriesPopularBloc(mockGetPopularTvSeries);
  });

  test('initial state should be empty', () {
    expect(tvseriesBloc.state, TvSeriesPopularEmpty());
  });

  blocTest<TvSeriesPopularBloc, TvSeriesPopularState>(
    'emit loading and hasData when data success',
    build: () {
      when(mockGetPopularTvSeries.execute())
          .thenAnswer((_) async => Right(testTvSeriesList));
      return tvseriesBloc;
    },
    act: (bloc) => bloc.add(OnTvSeriesPopularCalled()),
    expect: () => [
      TvSeriesPopularLoading(),
      TvSeriesPopularHasData(testTvSeriesList),
    ],
    verify: (bloc) {
      verify(mockGetPopularTvSeries.execute());
      return OnTvSeriesPopularCalled().props;
    },
  );

  blocTest<TvSeriesPopularBloc, TvSeriesPopularState>(
    ' emit loading and error when data unsuccessful',
    build: () {
      when(mockGetPopularTvSeries.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return tvseriesBloc;
    },
    act: (bloc) => bloc.add(OnTvSeriesPopularCalled()),
    expect: () => [
      TvSeriesPopularLoading(),
      TvSeriesPopularError('Server Failure'),
    ],
    verify: (bloc) => TvSeriesPopularLoading(),
  );

  blocTest<TvSeriesPopularBloc, TvSeriesPopularState>(
    'emit loading and empty when data empty',
    build: () {
      when(mockGetPopularTvSeries.execute())
          .thenAnswer((_) async => const Right([]));
      return tvseriesBloc;
    },
    act: (bloc) => bloc.add(OnTvSeriesPopularCalled()),
    expect: () => [
      TvSeriesPopularLoading(),
      TvSeriesPopularEmpty(),
    ],
  );
}