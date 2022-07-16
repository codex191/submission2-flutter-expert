import 'package:core/core.dart';

class GetTvSeriesWatchListStatus{
  final TvSeriesRepository repository;
  GetTvSeriesWatchListStatus(this.repository);

  Future<bool> execute(int id) async{
    return repository.IsAddedToWatchlisttvSeries(id);
  }
}