
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ditonton/domain/entities/tvseries.dart';
import 'package:ditonton/domain/usecases/tvseries/get_popular_tv_series.dart';
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