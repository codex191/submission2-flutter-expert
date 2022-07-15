import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tvseries.dart';
import 'package:ditonton/domain/usecases/tvseries/get_tv_series_recomendations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetTvSeriesRecommendations usecase;
  late MockTvSeriesRepository mockTvSeriesRepo;

  setUp(() {
    mockTvSeriesRepo = MockTvSeriesRepository();
    usecase = GetTvSeriesRecommendations(mockTvSeriesRepo);
  });

  final tvId = 1;
  final tvSeries = <TvSeries>[];

  test('should get list of tv series recommendations from the repository',
          () async {
        // arrange
        when(mockTvSeriesRepo.getTvSeriesRecommendations(tvId))
            .thenAnswer((_) async => Right(tvSeries));
        // act
        final result = await usecase.execute(tvId);
        // assert
        expect(result, Right(tvSeries));
      });
}