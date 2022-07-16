import 'package:dartz/dartz.dart';
import 'package:core/core.dart';

class RemoveTvSeriesWatchlist{
  final TvSeriesRepository repository;
  RemoveTvSeriesWatchlist(this.repository);

  Future<Either<Failure,String>> execute(TvSeriesDetail series) {
    return repository.removeTvSeriesWatchlist(series);
  }
}