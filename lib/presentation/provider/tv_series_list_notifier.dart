import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tvseries.dart';
import 'package:ditonton/domain/usecases/tvseries/get_now_playing_tv_series.dart';
import 'package:ditonton/domain/usecases/tvseries/get_popular_tv_series.dart';
import 'package:ditonton/domain/usecases/tvseries/get_top_rated_tv_series.dart';
import 'package:flutter/material.dart';

class TvListNotifier extends ChangeNotifier {
  var _nowPlayingTvSeries = <TvSeries>[];
  List<TvSeries> get nowPlayingTvSeries => _nowPlayingTvSeries;

  RequestState _nowPlayingState = RequestState.Empty;
  RequestState get nowPlayingState => _nowPlayingState;

  var _popularTv = <TvSeries>[];
  List<TvSeries> get popularTv => _popularTv;

  RequestState _popularTvState = RequestState.Empty;
  RequestState get popularTvState => _popularTvState;

  var _topRatedTvSeries = <TvSeries>[];
  List<TvSeries> get topRatedTvSeries => _topRatedTvSeries;

  RequestState _topRatedTvSeriesState = RequestState.Empty;
  RequestState get topRatedTvSeriesState => _topRatedTvSeriesState;

  String _message = '';
  String get message => _message;

  TvListNotifier({
    required this.getTopRatedTvSeries,
    required this.getPopularTv,
    required this.getNowPlayingTvSeries,
  });

  final GetNowPlayingTvSeries getNowPlayingTvSeries;
  final GetPopularTv getPopularTv;
  final GetTopRatedTvSeries getTopRatedTvSeries;

  Future<void> fetchNowPlayingMovies() async {
    _nowPlayingState = RequestState.Loading;
    notifyListeners();

    final result = await getNowPlayingTvSeries.execute();
    result.fold(
      (failure) {
        _nowPlayingState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (tvseriesData) {
        _nowPlayingState = RequestState.Loaded;
        _nowPlayingTvSeries = tvseriesData;
        notifyListeners();
      },
    );
  }

  Future<void> fetchPopularTv() async {
    _popularTvState = RequestState.Loading;
    notifyListeners();

    final result = await getPopularTv.execute();
    result.fold(
      (failure) {
        _popularTvState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (tvseriesData) {
        _popularTvState = RequestState.Loaded;
        _popularTv = tvseriesData;
        notifyListeners();
      },
    );
  }

  Future<void> fetchTopRatedMovies() async {
    _topRatedTvSeriesState = RequestState.Loading;
    notifyListeners();

    final result = await getTopRatedTvSeries.execute();
    result.fold(
      (failure) {
        _topRatedTvSeriesState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (tvseriesData) {
        _topRatedTvSeriesState = RequestState.Loaded;
        _topRatedTvSeries = tvseriesData;
        notifyListeners();
      },
    );
  }
}
