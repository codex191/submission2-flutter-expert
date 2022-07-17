// Mocks generated by Mockito 5.2.0 from annotations
// in watchlist/test/presentation/watchlist_tv_series_bloc_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:core/core.dart' as _i3;
import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:watchlist/domain/usecase/tv_series/get_tv_series_watchlist_status.dart'
    as _i6;
import 'package:watchlist/domain/usecase/tv_series/get_watchlist_tv_series.dart'
    as _i4;
import 'package:watchlist/domain/usecase/tv_series/remove_watchlist_tv_series.dart'
    as _i8;
import 'package:watchlist/domain/usecase/tv_series/save_watchlist_tv_series.dart'
    as _i7;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

class _FakeTvSeriesRepository_1 extends _i1.Fake
    implements _i3.TvSeriesRepository {}

/// A class which mocks [GetWatchListTvSeries].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetWatchListTvSeries extends _i1.Mock
    implements _i4.GetWatchListTvSeries {
  MockGetWatchListTvSeries() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Either<_i3.Failure, List<_i3.TvSeries>>> execute() =>
      (super.noSuchMethod(Invocation.method(#execute, []),
              returnValue:
                  Future<_i2.Either<_i3.Failure, List<_i3.TvSeries>>>.value(
                      _FakeEither_0<_i3.Failure, List<_i3.TvSeries>>()))
          as _i5.Future<_i2.Either<_i3.Failure, List<_i3.TvSeries>>>);
}

/// A class which mocks [GetTvSeriesWatchListStatus].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTvSeriesWatchListStatus extends _i1.Mock
    implements _i6.GetTvSeriesWatchListStatus {
  MockGetTvSeriesWatchListStatus() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.TvSeriesRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeTvSeriesRepository_1()) as _i3.TvSeriesRepository);
  @override
  _i5.Future<bool> execute(int? id) =>
      (super.noSuchMethod(Invocation.method(#execute, [id]),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
}

/// A class which mocks [SaveTvSeriesWatchlist].
///
/// See the documentation for Mockito's code generation for more information.
class MockSaveTvSeriesWatchlist extends _i1.Mock
    implements _i7.SaveTvSeriesWatchlist {
  MockSaveTvSeriesWatchlist() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.TvSeriesRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeTvSeriesRepository_1()) as _i3.TvSeriesRepository);
  @override
  _i5.Future<_i2.Either<_i3.Failure, String>> execute(
          _i3.TvSeriesDetail? series) =>
      (super.noSuchMethod(Invocation.method(#execute, [series]),
              returnValue: Future<_i2.Either<_i3.Failure, String>>.value(
                  _FakeEither_0<_i3.Failure, String>()))
          as _i5.Future<_i2.Either<_i3.Failure, String>>);
}

/// A class which mocks [RemoveTvSeriesWatchlist].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoveTvSeriesWatchlist extends _i1.Mock
    implements _i8.RemoveTvSeriesWatchlist {
  MockRemoveTvSeriesWatchlist() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.TvSeriesRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeTvSeriesRepository_1()) as _i3.TvSeriesRepository);
  @override
  _i5.Future<_i2.Either<_i3.Failure, String>> execute(
          _i3.TvSeriesDetail? series) =>
      (super.noSuchMethod(Invocation.method(#execute, [series]),
              returnValue: Future<_i2.Either<_i3.Failure, String>>.value(
                  _FakeEither_0<_i3.Failure, String>()))
          as _i5.Future<_i2.Either<_i3.Failure, String>>);
}