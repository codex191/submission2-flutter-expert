import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:watchlist/watchlist.dart';
import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../dummy_data/dummy_objects.dart';
import 'watchlist_tv_series_bloc_test.mocks.dart';

@GenerateMocks([
  GetWatchListTvSeries,
  GetTvSeriesWatchListStatus,
  SaveTvSeriesWatchlist,
  RemoveTvSeriesWatchlist,
])
void main() {
  const watchlistAddSuccessMessage = 'Added to Watchlist';
  const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  late MockGetWatchListTvSeries getWatchlistTvSeries;
  late MockGetTvSeriesWatchListStatus getWatchlistTvSeriesStatus;
  late MockSaveTvSeriesWatchlist saveTvSeriesWatchList;
  late MockRemoveTvSeriesWatchlist removeTvSeriesWatchlist;
  late TvSeriesWatchlistBloc watchlistBloc;

  setUp(() {
    getWatchlistTvSeries = MockGetWatchListTvSeries();
    getWatchlistTvSeriesStatus = MockGetTvSeriesWatchListStatus();
    saveTvSeriesWatchList = MockSaveTvSeriesWatchlist();
    removeTvSeriesWatchlist = MockRemoveTvSeriesWatchlist();
    watchlistBloc = TvSeriesWatchlistBloc(
      getWatchlistTvSeries,
      getWatchlistTvSeriesStatus,
      saveTvSeriesWatchList,
      removeTvSeriesWatchlist,
    );
  });

  test('initial state should be initial state', () {
    expect(watchlistBloc.state, TvSeriesWatchlistInitial());
  });

  group(
    'this test for get watchlist tv series, ',
    () {
      blocTest<TvSeriesWatchlistBloc, TvSeriesWatchlistState>(
        'should emit [Loading, HasData] when watchlist data is gotten succesfully',
        build: () {
          when(getWatchlistTvSeries.execute())
              .thenAnswer((_) async => Right([testWatchlistTvSeries]));
          return watchlistBloc;
        },
        act: (bloc) => bloc.add(OnFetchTvSeriesWatchlist()),
        expect: () => [
          TvSeriesWatchlistLoading(),
          TvSeriesWatchlistHasData([testWatchlistTvSeries]),
        ],
        verify: (bloc) {
          verify(getWatchlistTvSeries.execute());
          return OnFetchTvSeriesWatchlist().props;
        },
      );

      blocTest<TvSeriesWatchlistBloc, TvSeriesWatchlistState>(
        'should emit [Loading, Error] when watchlist data is unsuccessful',
        build: () {
          when(getWatchlistTvSeries.execute()).thenAnswer(
              (_) async => const Left(ServerFailure('Server Failure')));
          return watchlistBloc;
        },
        act: (bloc) => bloc.add(OnFetchTvSeriesWatchlist()),
        expect: () => [
          TvSeriesWatchlistLoading(),
          TvSeriesWatchlistError('Server Failure'),
        ],
        verify: (bloc) => TvSeriesWatchlistLoading(),
      );

      blocTest<TvSeriesWatchlistBloc, TvSeriesWatchlistState>(
        'should emit [Loading, Empty] when get watchlist data is empty',
        build: () {
          when(getWatchlistTvSeries.execute())
              .thenAnswer((_) async => const Right([]));
          return watchlistBloc;
        },
        act: (bloc) => bloc.add(OnFetchTvSeriesWatchlist()),
        expect: () => [
          TvSeriesWatchlistLoading(),
          TvSeriesWatchlistEmpty(),
        ],
      );
    },
  );

  group(
    'this test for get tv series watchlist status,',
    () {
      blocTest<TvSeriesWatchlistBloc, TvSeriesWatchlistState>(
        'should get true when the watchlist status is true',
        build: () {
          when(getWatchlistTvSeriesStatus.execute(testTvSeriesDetail.id))
              .thenAnswer((_) async => true);
          return watchlistBloc;
        },
        act: (bloc) => bloc.add(FetchTvSeriesWatchlistStatus(testTvSeriesDetail.id)),
        expect: () => [
          TvSeriesIsAddedToWatchlist(true),
        ],
        verify: (bloc) {
          verify(getWatchlistTvSeriesStatus.execute(testTvSeriesDetail.id));
          return FetchTvSeriesWatchlistStatus(testTvSeriesDetail.id).props;
        },
      );

      blocTest<TvSeriesWatchlistBloc, TvSeriesWatchlistState>(
        'should get false when the watchlist status is false',
        build: () {
          when(getWatchlistTvSeriesStatus.execute(testTvSeriesDetail.id))
              .thenAnswer((_) async => false);
          return watchlistBloc;
        },
        act: (bloc) => bloc.add(FetchTvSeriesWatchlistStatus(testTvSeriesDetail.id)),
        expect: () => [
          TvSeriesIsAddedToWatchlist(false),
        ],
        verify: (bloc) {
          verify(getWatchlistTvSeriesStatus.execute(testTvSeriesDetail.id));
          return FetchTvSeriesWatchlistStatus(testTvSeriesDetail.id).props;
        },
      );
    },
  );

  group(
    'this test for add and remove tv series watchlist,',
    () {
      blocTest<TvSeriesWatchlistBloc, TvSeriesWatchlistState>(
        'should update watchlist status when add watchlist is success',
        build: () {
          when(saveTvSeriesWatchList.execute(testTvSeriesDetail))
              .thenAnswer((_) async => const Right(watchlistAddSuccessMessage));
          return watchlistBloc;
        },
        act: (bloc) => bloc.add(AddTvSeriesToWatchlist(testTvSeriesDetail)),
        expect: () => [
          TvSeriesWatchlistMessage(watchlistAddSuccessMessage),
        ],
        verify: (bloc) {
          verify(saveTvSeriesWatchList.execute(testTvSeriesDetail));
          return AddTvSeriesToWatchlist(testTvSeriesDetail).props;
        },
      );

      blocTest<TvSeriesWatchlistBloc, TvSeriesWatchlistState>(
        'should throw failure message status when add watchlist is unsuccessful',
        build: () {
          when(saveTvSeriesWatchList.execute(testTvSeriesDetail)).thenAnswer(
              (_) async =>
                  const Left(DatabaseFailure('can\'t add data to watchlist')));
          return watchlistBloc;
        },
        act: (bloc) => bloc.add(AddTvSeriesToWatchlist(testTvSeriesDetail)),
        expect: () => [
          TvSeriesWatchlistError('can\'t add data to watchlist'),
        ],
        verify: (bloc) {
          verify(saveTvSeriesWatchList.execute(testTvSeriesDetail));
          return AddTvSeriesToWatchlist(testTvSeriesDetail).props;
        },
      );

      blocTest<TvSeriesWatchlistBloc, TvSeriesWatchlistState>(
        'should update watchlist status when remove watchlist is success',
        build: () {
          when(removeTvSeriesWatchlist.execute(testTvSeriesDetail)).thenAnswer(
              (_) async => const Right(watchlistRemoveSuccessMessage));
          return watchlistBloc;
        },
        act: (bloc) => bloc.add(RemoveTvSeriesFromWatchlist(testTvSeriesDetail)),
        expect: () => [
          TvSeriesWatchlistMessage(watchlistRemoveSuccessMessage),
        ],
        verify: (bloc) {
          verify(removeTvSeriesWatchlist.execute(testTvSeriesDetail));
          return RemoveTvSeriesFromWatchlist(testTvSeriesDetail).props;
        },
      );

      blocTest<TvSeriesWatchlistBloc, TvSeriesWatchlistState>(
        'should throw failure message status when remove watchlist is unsuccessful',
        build: () {
          when(removeTvSeriesWatchlist.execute(testTvSeriesDetail)).thenAnswer(
              (_) async =>
                  const Left(DatabaseFailure('cannot add data to watchlist')));
          return watchlistBloc;
        },
        act: (bloc) =>  bloc.add(RemoveTvSeriesFromWatchlist(testTvSeriesDetail)),
        expect: () => [
          TvSeriesWatchlistError('cannot add data to watchlist'),
        ],
        verify: (bloc) {
          verify(removeTvSeriesWatchlist.execute(testTvSeriesDetail));
          return RemoveTvSeriesFromWatchlist(testTvSeriesDetail).props;
        },
      );
    },
  );
}