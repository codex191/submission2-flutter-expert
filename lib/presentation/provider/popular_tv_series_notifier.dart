import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tvseries.dart';
import 'package:ditonton/domain/usecases/tvseries/get_popular_tv_series.dart';
import 'package:flutter/cupertino.dart';

class PopularTvNotifier extends ChangeNotifier {
  final GetPopularTv getPopularTv;
  
  PopularTvNotifier(this.getPopularTv);

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<TvSeries> _sseries = [];
  List<TvSeries> get sseries => _sseries;

  String _message = '';
  String get message => _message;

  Future<void> fetchPopularTv() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getPopularTv.execute();

    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.Error;
        notifyListeners();
      },
      (tvseriesData) {
        _sseries = tvseriesData;
        _state = RequestState.Loaded;
        notifyListeners();
      },
    );
  }
}
