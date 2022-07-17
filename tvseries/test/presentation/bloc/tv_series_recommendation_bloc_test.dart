import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries/tvseries.dart';
import '../../dummy_data/dummy_objects.dart';

import 'tv_series_recommendation_bloc_test.mocks.dart';

@GenerateMocks([GetTvSeriesRecommendations])
void main() {
  late MockGetTvSeriesRecommendations mockGetTvRecommmend;
  late TvSeriesRecommendationBloc tvseriesBloc;

  const tId = 1;

  setUp(() {
    mockGetTvRecommmend = MockGetTvSeriesRecommendations();
    tvseriesBloc = TvSeriesRecommendationBloc(mockGetTvRecommmend);
  });

  test('initial state should be empty', () {
    expect(tvseriesBloc.state, TvSeriesRecommendationEmpty());
  });

  blocTest<TvSeriesRecommendationBloc, TvSeriesRecommendationState>(
    'emit loading and hasdata when success',
    build: () {
      when(mockGetTvRecommmend.execute(tId))
          .thenAnswer((_) async => Right(testTvSeriesList));
      return tvseriesBloc;
    },
    act: (bloc) => bloc.add(OnTvSeriesRecommendationCalled(tId)),
    expect: () => [
      TvSeriesRecommendationLoading(),
      TvSeriesRecommendationHasData(testTvSeriesList),
    ],
    verify: (bloc) {
      verify(mockGetTvRecommmend.execute(tId));
      return OnTvSeriesRecommendationCalled(tId).props;
    },
  );

  blocTest<TvSeriesRecommendationBloc, TvSeriesRecommendationState>(
    'emit loading and error when unsuccess',
    build: () {
      when(mockGetTvRecommmend.execute(tId))
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return tvseriesBloc;
    },
    act: (bloc) => bloc.add(OnTvSeriesRecommendationCalled(tId)),
    expect: () => [
      TvSeriesRecommendationLoading(),
      TvSeriesRecommendationError('Server Failure'),
    ],
    verify: (bloc) => TvSeriesRecommendationLoading(),
  );

  blocTest<TvSeriesRecommendationBloc, TvSeriesRecommendationState>(
    'should emit [Loading, Empty] when get data is empty',
    build: () {
      when(mockGetTvRecommmend.execute(tId))
          .thenAnswer((_) async => const Right([]));
      return tvseriesBloc;
    },
    act: (bloc) => bloc.add(OnTvSeriesRecommendationCalled(tId)),
    expect: () => [
      TvSeriesRecommendationLoading(),
      TvSeriesRecommendationEmpty(),
    ],
  );
}