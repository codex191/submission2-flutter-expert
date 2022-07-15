import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tvseries.dart';
import 'package:ditonton/domain/entities/tv_series_detail.dart';
import 'package:ditonton/domain/usecases/tvseries/get_tv_series_detail.dart';
import 'package:ditonton/domain/usecases/tvseries/get_tv_series_recomendations.dart';
import 'package:ditonton/domain/usecases/tvseries/get_tv_series_watchlist_status.dart';
import 'package:ditonton/domain/usecases/tvseries/remove_watchlist_tv_series.dart';
import 'package:ditonton/domain/usecases/tvseries/save_watchlist_tv_series.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class TvSeriesDetailNotifier extends ChangeNotifier {
  static const watchlistAddSuccessMessage = 'Added to Watchlist';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  final GetTvSeriesDetail getTvSeriesDetail;
  final GetTvSeriesRecommendations getTvSeriesRecommendations;
  final GetTvSeriesWatchListStatus getTvSeriesWatchListStatus;
  final SaveTvSeriesWatchlist saveWatchlist;
  final RemoveTvSeriesWatchlist removeWatchlist;

  TvSeriesDetailNotifier({
    required this.getTvSeriesDetail,
    required this.getTvSeriesRecommendations,
    required this.getTvSeriesWatchListStatus,
    required this.saveWatchlist,
    required this.removeWatchlist
  });

  late TvSeriesDetail _tvsdetail;
  TvSeriesDetail get tvsdetail => _tvsdetail;

  RequestState _tvdetailState = RequestState.Empty;
  RequestState get tvdetailState => _tvdetailState;

  List<TvSeries> _tvseriesRecommendations = [];
  List<TvSeries> get tvseriesRecommendations => _tvseriesRecommendations;

  RequestState _recommendationState = RequestState.Empty;
  RequestState get recommendationState => _recommendationState;

  String _message = '';
  String get message => _message;

  bool _isAddedtoWatchlist = false;
  bool get isAddedToWatchlist => _isAddedtoWatchlist;

  Future<void> fetchTvSeriesDetail(int id) async {
    _tvdetailState = RequestState.Loading;
    notifyListeners();
    final detailResult = await getTvSeriesDetail.execute(id);
    final recommendationResult = await getTvSeriesRecommendations.execute(id);
    detailResult.fold(
      (failure) {
        _tvdetailState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (tvseries) {
        _recommendationState = RequestState.Loading;
        _tvsdetail = tvseries;
        notifyListeners();
        recommendationResult.fold(
          (failure) {
            _recommendationState = RequestState.Error;
            _message = failure.message;
          },
          (series) {
            _recommendationState = RequestState.Loaded;
            _tvseriesRecommendations = series;
          },
        );
        _tvdetailState = RequestState.Loaded;
        notifyListeners();
      },
    );
  }

  String _watchlistMessage = '';
  String get watchlistMessage => _watchlistMessage;

  Future<void> addTvSeriesWatchlist(TvSeriesDetail series) async {
    final result = await saveWatchlist.execute(series);

    await result.fold(
      (failure) async {
        _watchlistMessage = failure.message;
      },
      (successMessage) async {
        _watchlistMessage = successMessage;
      },
    );
    
    await loadTvSeriesWatchlistStatus(series.id);
  }

  Future<void> removeFromWatchlist(TvSeriesDetail detail) async{
    final result = await removeWatchlist.execute(detail);

    await result.fold(
          (failure) async {
        _watchlistMessage = failure.message;
      },
          (successMessage) async {
        _watchlistMessage = successMessage;
      },
    );

    await loadTvSeriesWatchlistStatus(detail.id);
  }

  Future<void> loadTvSeriesWatchlistStatus(int id) async{
    final result = await getTvSeriesWatchListStatus.execute(id);
    _isAddedtoWatchlist = result;
    print(result);
    notifyListeners();
  }
}
