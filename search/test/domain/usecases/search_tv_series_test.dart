import 'package:dartz/dartz.dart';
import 'package:core/core.dart';
import 'package:search/search.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late SearchTvSeries usecase;
  late MockTvSeriesRepository mockTvSeriesRepository;

  setUp(() {
    mockTvSeriesRepository = MockTvSeriesRepository();
    usecase = SearchTvSeries(mockTvSeriesRepository);
  });

  final tvSeries = <TvSeries>[];
  final tQuery = 'Emily In Paris';

  test('should get list of tv series from the repository', () async {
    // arrange
    when(mockTvSeriesRepository.searchTvSeries(tQuery))
        .thenAnswer((_) async => Right(tvSeries));
    // act
    final result = await usecase.execute(tQuery);
    // assert
    expect(result, Right(tvSeries));
  });
}