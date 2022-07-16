import 'package:dartz/dartz.dart';
import 'package:core/core.dart';

class SearchTvSeries{
  final TvSeriesRepository repository;
  SearchTvSeries(this.repository);

  Future<Either<Failure,List<TvSeries>>> execute(String query) {
    return repository.searchTvSeries(query);
  }
}