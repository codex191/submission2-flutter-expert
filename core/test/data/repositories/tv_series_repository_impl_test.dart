

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late TvSeriesRepositoryImpl repository;
  late MockTvSeriesRemoteDataSource mockRemoteDataSource;
  late MockTvSeriesLocalDataSource mockLocalDataSource;

  setUp(() {
    mockRemoteDataSource = MockTvSeriesRemoteDataSource();
    mockLocalDataSource = MockTvSeriesLocalDataSource();
    repository = TvSeriesRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
    );
  });

  final tTvSeriesModel = TvSeriesModel(
    backdropPath: 'backdropPath',
    firstAirDate: "2021-09-03",
    genreIds: [1, 2, 3],
    id: 1,
    name: 'name',
    originalLanguage: 'originalLanguage',
    originalName: 'originalName',
    overview: 'overview',
    popularity: 18.591,
    posterPath: 'posterPath',
    voteAverage: 9.4,
    voteCount: 2710,
  );

  final tSeries = TvSeries(
    backdropPath: 'backdropPath',
    firstAirDate: "2021-09-03",
    genreIds: [1, 2, 3],
    id: 1,
    name: 'name',
    originalLanguage: 'originalLanguage',
    originalName: 'originalName',
    overview: 'overview',
    popularity: 18.591,
    posterPath: 'posterPath',
    voteAverage: 9.4,
    voteCount: 2710,
  );

  final tTvSeriesModelList = <TvSeriesModel>[tTvSeriesModel];
  final tTvSeriesList = <TvSeries>[tSeries];

  group('Now Playing Tv Series', () {
    test(
        'should return remote data when the call to remote data source is successful',
            () async {
          // arrange
          when(mockRemoteDataSource.getNowPlayingTvSeries())
              .thenAnswer((_) async => tTvSeriesModelList);
          // act
          final result = await repository.getNowPlayingTvSeries();
          // assert
          verify(mockRemoteDataSource.getNowPlayingTvSeries());
          /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
          final resultList = result.getOrElse(() => []);
          expect(resultList, tTvSeriesList);
        });

    test(
        'should return server failure when the call to remote data source is unsuccessful',
            () async {
          // arrange
          when(mockRemoteDataSource.getNowPlayingTvSeries())
              .thenThrow(ServerException());
          // act
          final result = await repository.getNowPlayingTvSeries();
          // assert
          verify(mockRemoteDataSource.getNowPlayingTvSeries());
          expect(result, equals(const Left(ServerFailure(''))));
        });

    test(
        'should return connection failure when the device is not connected to internet',
            () async {
          // arrange
          when(mockRemoteDataSource.getNowPlayingTvSeries())
              .thenThrow(const SocketException('Failed to connect to the network'));
          // act
          final result = await repository.getNowPlayingTvSeries();
          // assert
          verify(mockRemoteDataSource.getNowPlayingTvSeries());
          expect(result,
              equals(const Left(ConnectionFailure('Failed to connect to the network'))));
        });
  });

  group('Popular Tv Series', () {
    test('should return tv series list when call to data source is success',
            () async {
          // arrange
          when(mockRemoteDataSource.getPopularTvSeries())
              .thenAnswer((_) async => tTvSeriesModelList);
          // act
          final result = await repository.getPopularTv();
          // assert
          /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
          final resultList = result.getOrElse(() => []);
          expect(resultList, tTvSeriesList);
        });

    test(
        'should return server failure when call to data source is unsuccessful',
            () async {
          // arrange
          when(mockRemoteDataSource.getPopularTvSeries())
              .thenThrow(ServerException());
          // act
          final result = await repository.getPopularTv();
          // assert
          expect(result, const Left(ServerFailure('')));
        });

    test(
        'should return connection failure when device is not connected to the internet',
            () async {
          // arrange
          when(mockRemoteDataSource.getPopularTvSeries())
              .thenThrow(const SocketException('Failed to connect to the network'));
          // act
          final result = await repository.getPopularTv();
          // assert
          expect(
              result, const Left(ConnectionFailure('Failed to connect to the network')));
        });
  });

  group('Top Rated Tv Series', () {
    test('should return Tv Series list when call to data source is successful',
            () async {
          // arrange
          when(mockRemoteDataSource.getTopRatedTvSeries())
              .thenAnswer((_) async => tTvSeriesModelList);
          // act
          final result = await repository.getTopRatedTvSeries();
          // assert
          /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
          final resultList = result.getOrElse(() => []);
          expect(resultList, tTvSeriesList);
        });

    test('should return ServerFailure when call to data source is unsuccessful',
            () async {
          // arrange
          when(mockRemoteDataSource.getTopRatedTvSeries())
              .thenThrow(ServerException());
          // act
          final result = await repository.getTopRatedTvSeries();
          // assert
          expect(result, const Left(ServerFailure('')));
        });

    test(
        'should return ConnectionFailure when device is not connected to the internet',
            () async {
          // arrange
          when(mockRemoteDataSource.getTopRatedTvSeries())
              .thenThrow(const SocketException('Failed to connect to the network'));
          // act
          final result = await repository.getTopRatedTvSeries();
          // assert
          expect(
              result, const Left(ConnectionFailure('Failed to connect to the network')));
        });
  });

  group('Get Tv Series Detail', () {
    final tId = 1;
    final tTvSeriesResponse = TvSeriesDetailResponse(
      backdropPath: 'backdropPath',
      episodeRunTime: [1],
      genres: [GenreModel(id: 1, name: 'Action')],
      id: 1,
      originalName: 'originalName',
      overview: 'overview',
      posterPath: 'posterPath',
      popularity: 1,
      name: 'name',
      voteAverage: 1,
      voteCount: 1,
    );

    test(
        'should return Tv Series data when the call to remote data source is successful',
            () async {
          // arrange
          when(mockRemoteDataSource.getTvSeriesDetail(tId))
              .thenAnswer((_) async => tTvSeriesResponse);
          // act
          final result = await repository.getTvSeriesDetail(tId);
          // assert
          verify(mockRemoteDataSource.getTvSeriesDetail(tId));
          expect(result, equals(Right(testTvSeriesDetail)));
        });

    test(
        'should return Server Failure when the call to remote data source is unsuccessful',
            () async {
          // arrange
          when(mockRemoteDataSource.getTvSeriesDetail(tId))
              .thenThrow(ServerException());
          // act
          final result = await repository.getTvSeriesDetail(tId);
          // assert
          verify(mockRemoteDataSource.getTvSeriesDetail(tId));
          expect(result, equals(const Left(ServerFailure(''))));
        });

    test(
        'should return connection failure when the device is not connected to internet',
            () async {
          // arrange
          when(mockRemoteDataSource.getTvSeriesDetail(tId))
              .thenThrow(const SocketException('Failed to connect to the network'));
          // act
          final result = await repository.getTvSeriesDetail(tId);
          // assert
          verify(mockRemoteDataSource.getTvSeriesDetail(tId));
          expect(result,
              equals(const Left(ConnectionFailure('Failed to connect to the network'))));
        });
  });

  group('Get Tv Series Recommendations', () {
    final tTvSeriesList = <TvSeriesModel>[];
    final tId = 1;

    test('should return data (tv series list) when the call is successful',
            () async {
          // arrange
          when(mockRemoteDataSource.getTvSeriesRecommendations(tId))
              .thenAnswer((_) async => tTvSeriesList);
          // act
          final result = await repository.getTvSeriesRecommendations(tId);
          // assert
          verify(mockRemoteDataSource.getTvSeriesRecommendations(tId));
          /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
          final resultList = result.getOrElse(() => []);
          expect(resultList, equals(tTvSeriesList));
        });

    test(
        'should return server failure when call to remote data source is unsuccessful',
            () async {
          // arrange
          when(mockRemoteDataSource.getTvSeriesRecommendations(tId))
              .thenThrow(ServerException());
          // act
          final result = await repository.getTvSeriesRecommendations(tId);
          // assertbuild runner
          verify(mockRemoteDataSource.getTvSeriesRecommendations(tId));
          expect(result, equals(const Left(ServerFailure(''))));
        });

    test(
        'should return connection failure when the device is not connected to the internet',
            () async {
          // arrange
          when(mockRemoteDataSource.getTvSeriesRecommendations(tId))
              .thenThrow(const SocketException('Failed to connect to the network'));
          // act
          final result = await repository.getTvSeriesRecommendations(tId);
          // assert
          verify(mockRemoteDataSource.getTvSeriesRecommendations(tId));
          expect(result,
              equals(const Left(ConnectionFailure('Failed to connect to the network'))));
        });
  });

  group('Seach Tv Series', () {
    final tQuery = 'Halo';

    test('should return tv series list when call to data source is successful',
            () async {
          // arrange
          when(mockRemoteDataSource.searchTvSeries(tQuery))
              .thenAnswer((_) async => tTvSeriesModelList);
          // act
          final result = await repository.searchTvSeries(tQuery);
          // assert
          /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
          final resultList = result.getOrElse(() => []);
          expect(resultList, tTvSeriesList);
        });

    test('should return ServerFailure when call to data source is unsuccessful',
            () async {
          // arrange
          when(mockRemoteDataSource.searchTvSeries(tQuery))
              .thenThrow(ServerException());
          // act
          final result = await repository.searchTvSeries(tQuery);
          // assert
          expect(result, const Left(ServerFailure('')));
        });

    test(
        'should return ConnectionFailure when device is not connected to the internet',
            () async {
          // arrange
          when(mockRemoteDataSource.searchTvSeries(tQuery))
              .thenThrow(const SocketException('Failed to connect to the network'));
          // act
          final result = await repository.searchTvSeries(tQuery);
          // assert
          expect(
              result, const Left(ConnectionFailure('Failed to connect to the network')));
        });
  });

  group('save Tv Series watchlist', () {
    test('should return success message when saving successful', () async {
      // arrange
      when(mockLocalDataSource.insertTvSeriesWatchlist(testTvSeriesTable))
          .thenAnswer((_) async => 'Added to Watchlist');
      // act
      final result = await repository.saveTvSeriesWatchlist(testTvSeriesDetail);
      // assert
      expect(result, const Right('Added to Watchlist'));
    });

    test('should return DatabaseFailure when saving unsuccessful', () async {
      // arrange
      when(mockLocalDataSource.insertTvSeriesWatchlist(testTvSeriesTable))
          .thenThrow(DatabaseException('Failed to add watchlist'));
      // act
      final result = await repository.saveTvSeriesWatchlist(testTvSeriesDetail);
      // assert
      expect(result, const Left(DatabaseFailure('Failed to add watchlist')));
    });
  });

  group('remove watchlist', () {
    test('should return success message when remove successful', () async {
      // arrange
      when(mockLocalDataSource.removeTvSeriesWatchlist(testTvSeriesTable))
          .thenAnswer((_) async => 'Removed from watchlist');
      // act
      final result =
      await repository.removeTvSeriesWatchlist(testTvSeriesDetail);
      // assert
      expect(result, const Right('Removed from watchlist'));
    });

    test('should return DatabaseFailure when remove unsuccessful', () async {
      // arrange
      when(mockLocalDataSource.removeTvSeriesWatchlist(testTvSeriesTable))
          .thenThrow(DatabaseException('Failed to remove watchlist'));
      // act
      final result =
      await repository.removeTvSeriesWatchlist(testTvSeriesDetail);
      // assert
      expect(result, const Left(DatabaseFailure('Failed to remove watchlist')));
    });
  });

  group('get watchlist status', () {
    test('should return watch status whether data is found', () async {
      // arrange
      final tId = 1;
      when(mockLocalDataSource.getTvSeriesById(tId))
          .thenAnswer((_) async => null);
      // act
      final result = await repository.IsAddedToWatchlisttvSeries(tId);
      // assert
      expect(result, false);
    });
  });

  group('get watchlist Tv Series', () {
    test('should return list of Tv Series', () async {
      // arrange
      when(mockLocalDataSource.getWatchlistTvSeries())
          .thenAnswer((_) async => [testTvSeriesTable]);
      // act
      final result = await repository.getWatchlistTvSeries();
      // assert
      final resultList = result.getOrElse(() => []);
      expect(resultList, [testWatchlistTvSeries]);
    });
  });
}