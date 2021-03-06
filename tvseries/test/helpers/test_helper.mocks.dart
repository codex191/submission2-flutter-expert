// Mocks generated by Mockito 5.2.0 from annotations
// in tvseries/test/helpers/test_helper.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;
import 'dart:convert' as _i7;
import 'dart:typed_data' as _i8;

import 'package:core/core.dart' as _i3;
import 'package:dartz/dartz.dart' as _i2;
import 'package:http/http.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:sqflite/sqflite.dart' as _i6;

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

class _FakeTvSeriesDetailResponse_1 extends _i1.Fake
    implements _i3.TvSeriesDetailResponse {}

class _FakeResponse_2 extends _i1.Fake implements _i4.Response {}

class _FakeStreamedResponse_3 extends _i1.Fake implements _i4.StreamedResponse {
}

/// A class which mocks [DatabaseHelperTvSeries].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseHelperTvSeries extends _i1.Mock
    implements _i3.DatabaseHelperTvSeries {
  MockDatabaseHelperTvSeries() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i6.Database?> get database => (super.noSuchMethod(
      Invocation.getter(#database),
      returnValue: Future<_i6.Database?>.value()) as _i5.Future<_i6.Database?>);
  @override
  _i5.Future<int> insertTvSeriesWatchlist(_i3.TvSeriesTable? tvsTable) => (super
      .noSuchMethod(Invocation.method(#insertTvSeriesWatchlist, [tvsTable]),
          returnValue: Future<int>.value(0)) as _i5.Future<int>);
  @override
  _i5.Future<int> removeTvSeriesWatchlist(_i3.TvSeriesTable? tvsTable) => (super
      .noSuchMethod(Invocation.method(#removeTvSeriesWatchlist, [tvsTable]),
          returnValue: Future<int>.value(0)) as _i5.Future<int>);
  @override
  _i5.Future<Map<String, dynamic>?> getTvSeriesById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvSeriesById, [id]),
              returnValue: Future<Map<String, dynamic>?>.value())
          as _i5.Future<Map<String, dynamic>?>);
  @override
  _i5.Future<List<Map<String, dynamic>>> getWatchlistTvSeries() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistTvSeries, []),
              returnValue: Future<List<Map<String, dynamic>>>.value(
                  <Map<String, dynamic>>[]))
          as _i5.Future<List<Map<String, dynamic>>>);
}

/// A class which mocks [TvSeriesRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvSeriesRepository extends _i1.Mock
    implements _i3.TvSeriesRepository {
  MockTvSeriesRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Either<_i3.Failure, List<_i3.TvSeries>>>
      getNowPlayingTvSeries() =>
          (super.noSuchMethod(Invocation.method(#getNowPlayingTvSeries, []),
                  returnValue:
                      Future<_i2.Either<_i3.Failure, List<_i3.TvSeries>>>.value(
                          _FakeEither_0<_i3.Failure, List<_i3.TvSeries>>()))
              as _i5.Future<_i2.Either<_i3.Failure, List<_i3.TvSeries>>>);
  @override
  _i5.Future<_i2.Either<_i3.Failure, List<_i3.TvSeries>>> getPopularTv() =>
      (super.noSuchMethod(Invocation.method(#getPopularTv, []),
              returnValue:
                  Future<_i2.Either<_i3.Failure, List<_i3.TvSeries>>>.value(
                      _FakeEither_0<_i3.Failure, List<_i3.TvSeries>>()))
          as _i5.Future<_i2.Either<_i3.Failure, List<_i3.TvSeries>>>);
  @override
  _i5.Future<_i2.Either<_i3.Failure, List<_i3.TvSeries>>>
      getTopRatedTvSeries() =>
          (super.noSuchMethod(Invocation.method(#getTopRatedTvSeries, []),
                  returnValue:
                      Future<_i2.Either<_i3.Failure, List<_i3.TvSeries>>>.value(
                          _FakeEither_0<_i3.Failure, List<_i3.TvSeries>>()))
              as _i5.Future<_i2.Either<_i3.Failure, List<_i3.TvSeries>>>);
  @override
  _i5.Future<_i2.Either<_i3.Failure, _i3.TvSeriesDetail>> getTvSeriesDetail(
          int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvSeriesDetail, [id]),
              returnValue:
                  Future<_i2.Either<_i3.Failure, _i3.TvSeriesDetail>>.value(
                      _FakeEither_0<_i3.Failure, _i3.TvSeriesDetail>()))
          as _i5.Future<_i2.Either<_i3.Failure, _i3.TvSeriesDetail>>);
  @override
  _i5.Future<_i2.Either<_i3.Failure, List<_i3.TvSeries>>>
      getTvSeriesRecommendations(int? id) => (super.noSuchMethod(
              Invocation.method(#getTvSeriesRecommendations, [id]),
              returnValue:
                  Future<_i2.Either<_i3.Failure, List<_i3.TvSeries>>>.value(
                      _FakeEither_0<_i3.Failure, List<_i3.TvSeries>>()))
          as _i5.Future<_i2.Either<_i3.Failure, List<_i3.TvSeries>>>);
  @override
  _i5.Future<_i2.Either<_i3.Failure, List<_i3.TvSeries>>> searchTvSeries(
          String? query) =>
      (super.noSuchMethod(Invocation.method(#searchTvSeries, [query]),
              returnValue:
                  Future<_i2.Either<_i3.Failure, List<_i3.TvSeries>>>.value(
                      _FakeEither_0<_i3.Failure, List<_i3.TvSeries>>()))
          as _i5.Future<_i2.Either<_i3.Failure, List<_i3.TvSeries>>>);
  @override
  _i5.Future<_i2.Either<_i3.Failure, String>> saveTvSeriesWatchlist(
          _i3.TvSeriesDetail? series) =>
      (super.noSuchMethod(Invocation.method(#saveTvSeriesWatchlist, [series]),
              returnValue: Future<_i2.Either<_i3.Failure, String>>.value(
                  _FakeEither_0<_i3.Failure, String>()))
          as _i5.Future<_i2.Either<_i3.Failure, String>>);
  @override
  _i5.Future<_i2.Either<_i3.Failure, String>> removeTvSeriesWatchlist(
          _i3.TvSeriesDetail? series) =>
      (super.noSuchMethod(Invocation.method(#removeTvSeriesWatchlist, [series]),
              returnValue: Future<_i2.Either<_i3.Failure, String>>.value(
                  _FakeEither_0<_i3.Failure, String>()))
          as _i5.Future<_i2.Either<_i3.Failure, String>>);
  @override
  _i5.Future<bool> IsAddedToWatchlisttvSeries(int? id) =>
      (super.noSuchMethod(Invocation.method(#IsAddedToWatchlisttvSeries, [id]),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
  @override
  _i5.Future<_i2.Either<_i3.Failure, List<_i3.TvSeries>>>
      getWatchlistTvSeries() =>
          (super.noSuchMethod(Invocation.method(#getWatchlistTvSeries, []),
                  returnValue:
                      Future<_i2.Either<_i3.Failure, List<_i3.TvSeries>>>.value(
                          _FakeEither_0<_i3.Failure, List<_i3.TvSeries>>()))
              as _i5.Future<_i2.Either<_i3.Failure, List<_i3.TvSeries>>>);
}

/// A class which mocks [TvSeriesRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvSeriesRemoteDataSource extends _i1.Mock
    implements _i3.TvSeriesRemoteDataSource {
  MockTvSeriesRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<List<_i3.TvSeriesModel>> getNowPlayingTvSeries() =>
      (super.noSuchMethod(Invocation.method(#getNowPlayingTvSeries, []),
              returnValue:
                  Future<List<_i3.TvSeriesModel>>.value(<_i3.TvSeriesModel>[]))
          as _i5.Future<List<_i3.TvSeriesModel>>);
  @override
  _i5.Future<List<_i3.TvSeriesModel>> getPopularTvSeries() =>
      (super.noSuchMethod(Invocation.method(#getPopularTvSeries, []),
              returnValue:
                  Future<List<_i3.TvSeriesModel>>.value(<_i3.TvSeriesModel>[]))
          as _i5.Future<List<_i3.TvSeriesModel>>);
  @override
  _i5.Future<List<_i3.TvSeriesModel>> getTopRatedTvSeries() =>
      (super.noSuchMethod(Invocation.method(#getTopRatedTvSeries, []),
              returnValue:
                  Future<List<_i3.TvSeriesModel>>.value(<_i3.TvSeriesModel>[]))
          as _i5.Future<List<_i3.TvSeriesModel>>);
  @override
  _i5.Future<List<_i3.TvSeriesModel>> searchTvSeries(String? query) =>
      (super.noSuchMethod(Invocation.method(#searchTvSeries, [query]),
              returnValue:
                  Future<List<_i3.TvSeriesModel>>.value(<_i3.TvSeriesModel>[]))
          as _i5.Future<List<_i3.TvSeriesModel>>);
  @override
  _i5.Future<List<_i3.TvSeriesModel>> getTvSeriesRecommendations(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvSeriesRecommendations, [id]),
              returnValue:
                  Future<List<_i3.TvSeriesModel>>.value(<_i3.TvSeriesModel>[]))
          as _i5.Future<List<_i3.TvSeriesModel>>);
  @override
  _i5.Future<_i3.TvSeriesDetailResponse> getTvSeriesDetail(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvSeriesDetail, [id]),
              returnValue: Future<_i3.TvSeriesDetailResponse>.value(
                  _FakeTvSeriesDetailResponse_1()))
          as _i5.Future<_i3.TvSeriesDetailResponse>);
}

/// A class which mocks [TvSeriesLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvSeriesLocalDataSource extends _i1.Mock
    implements _i3.TvSeriesLocalDataSource {
  MockTvSeriesLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<String> insertTvSeriesWatchlist(_i3.TvSeriesTable? series) =>
      (super.noSuchMethod(Invocation.method(#insertTvSeriesWatchlist, [series]),
          returnValue: Future<String>.value('')) as _i5.Future<String>);
  @override
  _i5.Future<String> removeTvSeriesWatchlist(_i3.TvSeriesTable? series) =>
      (super.noSuchMethod(Invocation.method(#removeTvSeriesWatchlist, [series]),
          returnValue: Future<String>.value('')) as _i5.Future<String>);
  @override
  _i5.Future<_i3.TvSeriesTable?> getTvSeriesById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvSeriesById, [id]),
              returnValue: Future<_i3.TvSeriesTable?>.value())
          as _i5.Future<_i3.TvSeriesTable?>);
  @override
  _i5.Future<List<_i3.TvSeriesTable>> getWatchlistTvSeries() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistTvSeries, []),
              returnValue:
                  Future<List<_i3.TvSeriesTable>>.value(<_i3.TvSeriesTable>[]))
          as _i5.Future<List<_i3.TvSeriesTable>>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i4.Client {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i4.Response> head(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#head, [url], {#headers: headers}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i5.Future<_i4.Response>);
  @override
  _i5.Future<_i4.Response> get(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#get, [url], {#headers: headers}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i5.Future<_i4.Response>);
  @override
  _i5.Future<_i4.Response> post(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i7.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#post, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i5.Future<_i4.Response>);
  @override
  _i5.Future<_i4.Response> put(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i7.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#put, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i5.Future<_i4.Response>);
  @override
  _i5.Future<_i4.Response> patch(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i7.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#patch, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i5.Future<_i4.Response>);
  @override
  _i5.Future<_i4.Response> delete(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i7.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#delete, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i5.Future<_i4.Response>);
  @override
  _i5.Future<String> read(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#read, [url], {#headers: headers}),
          returnValue: Future<String>.value('')) as _i5.Future<String>);
  @override
  _i5.Future<_i8.Uint8List> readBytes(Uri? url,
          {Map<String, String>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#readBytes, [url], {#headers: headers}),
              returnValue: Future<_i8.Uint8List>.value(_i8.Uint8List(0)))
          as _i5.Future<_i8.Uint8List>);
  @override
  _i5.Future<_i4.StreamedResponse> send(_i4.BaseRequest? request) =>
      (super.noSuchMethod(Invocation.method(#send, [request]),
              returnValue:
                  Future<_i4.StreamedResponse>.value(_FakeStreamedResponse_3()))
          as _i5.Future<_i4.StreamedResponse>);
  @override
  void close() => super.noSuchMethod(Invocation.method(#close, []),
      returnValueForMissingStub: null);
}
