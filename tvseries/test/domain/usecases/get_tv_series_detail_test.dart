
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries/tvseries.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetTvSeriesDetail usecase;
  late MockTvSeriesRepository mockTvSeriesRepository;

  setUp(() {
    mockTvSeriesRepository = MockTvSeriesRepository();
    usecase = GetTvSeriesDetail(mockTvSeriesRepository);
  });

  final tvsId = 1;

  test('should get tv series detail from the repository', () async {
    // arrange
    when(mockTvSeriesRepository.getTvSeriesDetail(tvsId))
        .thenAnswer((_) async => Right(testTvSeriesDetail));
    // act
    final result = await usecase.execute(tvsId);
    // assert
    expect(result, Right(testTvSeriesDetail));
  });
}