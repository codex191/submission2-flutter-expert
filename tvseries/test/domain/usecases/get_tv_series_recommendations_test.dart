import 'package:dartz/dartz.dart';
import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries/tvseries.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetTvSeriesRecommendations usecase;
  late MockTvSeriesRepository mockTvSeriesRepo;

  setUp(() {
    mockTvSeriesRepo = MockTvSeriesRepository();
    usecase = GetTvSeriesRecommendations(mockTvSeriesRepo);
  });

  final tvsId = 1;
  final tvSeries = <TvSeries>[];

  test('should get list of tv series recommendations from the repository',
    () async {
  // arrange
   when(mockTvSeriesRepo.getTvSeriesRecommendations(tvsId))
      .thenAnswer((_) async => Right(tvSeries));
  // act
  final result = await usecase.execute(tvsId);
  // assert
  expect(result, Right(tvSeries));
});
}