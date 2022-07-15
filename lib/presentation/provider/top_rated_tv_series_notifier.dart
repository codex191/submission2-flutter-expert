import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tvseries.dart';
import 'package:ditonton/domain/usecases/tvseries/get_top_rated_tv_series.dart';
import 'package:flutter/cupertino.dart';

class TopRatedTvSeriesNotifier extends ChangeNotifier{
  final GetTopRatedTvSeries getTopRatedTvSeries;

  TopRatedTvSeriesNotifier({required this.getTopRatedTvSeries});

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<TvSeries> _tvsseries = [];
  List<TvSeries> get tvsseries => _tvsseries;

  String _message = '';
  String get message => _message;

  Future<void> fetchTopRatedTvSeries() async{
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getTopRatedTvSeries.execute();

    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.Error;
        notifyListeners();
      },
      (tvseriesData) {
        _tvsseries = tvseriesData;
        _state = RequestState.Loaded;
        notifyListeners();
      },
    );
  }
}
