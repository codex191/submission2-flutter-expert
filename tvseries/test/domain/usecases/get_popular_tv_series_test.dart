
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:core/core.dart';
import 'package:tvseries/tvseries.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetPopularTv usecase;
  late MockTvSeriesRepository mockTvSeriesRpository;

  setUp(() {
    mockTvSeriesRpository = MockTvSeriesRepository();
    usecase = GetPopularTv(mockTvSeriesRpository);
  });

  final tvSeries = <TvSeries>[];

  group('GetPopularTvSeries Tests', () {
    group('execute', () {
      test(
          'should get list of tv series from the repository when execute function is called',
              () async {
            // arrange
            when(mockTvSeriesRpository.getPopularTv())
                .thenAnswer((_) async => Right(tvSeries));
            // act
            final result = await usecase.execute();
            // assert
            expect(result, Right(tvSeries));
          });
    });
  });
}