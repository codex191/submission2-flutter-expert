import 'package:dartz/dartz.dart';
import 'package:core/core.dart';

class SaveTvSeriesWatchlist{
  final TvSeriesRepository repository;
  SaveTvSeriesWatchlist(this.repository);

  Future<Either<Failure,String>> execute(TvSeriesDetail series) {
    return repository.saveTvSeriesWatchlist(series);
  }
}