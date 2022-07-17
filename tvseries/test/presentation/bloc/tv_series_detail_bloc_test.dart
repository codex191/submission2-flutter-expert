import 'package:dartz/dartz.dart';
import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries/tvseries.dart';
import 'package:bloc_test/bloc_test.dart';

import '../../dummy_data/dummy_objects.dart';
import 'tv_series_detail_bloc_test.mocks.dart';

@GenerateMocks([
  GetTvSeriesDetail,
  GetTvSeriesRecommendations,
])
void main() {
  late MockGetTvSeriesDetail mockGetTvSeriesDetail;
  late TvSeriesDetailBloc tvseriesBloc;

  const tId = 1;

  setUp(() {
    mockGetTvSeriesDetail = MockGetTvSeriesDetail();
    tvseriesBloc = TvSeriesDetailBloc(mockGetTvSeriesDetail);
  });

  test('initial state should be empty', () {
    expect(tvseriesBloc.state, TvSeriesDetailEmpty());
  });

  blocTest<TvSeriesDetailBloc, TvSeriesDetailState>(
    'should emit Loading state and then Error state when data failed to fetch',
    build: () {
      when(mockGetTvSeriesDetail.execute(tId))
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return tvseriesBloc;
    },
    act: (blocAct) => blocAct.add(OnTvSeriesDetailCalled(tId)),
    expect: () => [
      TvSeriesDetailLoading(),
      TvSeriesDetailError('Server Failure'),
    ],
    verify: (blocAct) => TvSeriesDetailLoading(),
  );
}