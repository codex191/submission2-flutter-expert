import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:search/search.dart';

import 'tv_series_search_bloc_test.mocks.dart';

@GenerateMocks([SearchTvSeries])
void main() {
  late MockSearchTvSeries mockSearchTvSeries;
  late SearchTvSeriesBloc searchBloc;

  setUp(() {
    mockSearchTvSeries = MockSearchTvSeries();
    searchBloc = SearchTvSeriesBloc(mockSearchTvSeries);
  });

  final tSeries = TvSeries(
    backdropPath: 'backdropPath',
    genreIds: const [1, 2, 3],
    id: 1,
    originalName: 'originalName',
    originalLanguage: 'en',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    firstAirDate: 'firstAirDate',
    name: 'name',
    voteAverage: 1,
    voteCount: 1,
  );

  final tSeriesList = <TvSeries>[tSeries];
  final tQuery = 'Emily in paris';

 test('initial state should be empty', () {
    expect(searchBloc.state, SearchTvSeriesEmpty());
  });

  blocTest<SearchTvSeriesBloc, SearchTvSeriesState>(
    'should emit [HasData] when data is gotten successfully',
    build: () {
      when(mockSearchTvSeries.execute(tQuery))
          .thenAnswer((_) async => Right(tSeriesList));
      return searchBloc;
    },
    act: (bloc) => bloc.add(OnQueryTvSeriesChange(tQuery)),
    wait: const Duration(milliseconds: 200),
    expect: () => [
      SearchTvSeriesHasData(tSeriesList),
    ],
    verify: (bloc) {
      verify(mockSearchTvSeries.execute(tQuery));
      return OnQueryTvSeriesChange(tQuery).props;
    },
  );

  blocTest<SearchTvSeriesBloc, SearchTvSeriesState>(
    'should emit [Error] lwhen get search is unsuccessful',
    build: () {
      when(mockSearchTvSeries.execute(tQuery))
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return searchBloc;
    },
    act: (bloc) => bloc.add(OnQueryTvSeriesChange(tQuery)),
    wait: const Duration(milliseconds: 200),
    expect: () => [
      SearchTvSeriesError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockSearchTvSeries.execute(tQuery));
      return SearchTvSeriesLoading().props;
    },
  );

  blocTest<SearchTvSeriesBloc, SearchTvSeriesState>(
    'should emit [empty] when get search is empty',
    build: () {
      when(mockSearchTvSeries.execute(tQuery))
          .thenAnswer((_) async => const Right([]));
      return searchBloc;
    },
    act: (bloc) => bloc.add(OnQueryTvSeriesChange(tQuery)),
    wait: const Duration(milliseconds: 200),
    expect: () => [
      SearchTvSeriesEmpty(),
    ],
    verify: (bloc) {
      verify(mockSearchTvSeries.execute(tQuery));
    },
  );
}