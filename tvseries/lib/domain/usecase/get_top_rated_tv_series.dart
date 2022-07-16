import 'package:dartz/dartz.dart';
import 'package:core/core.dart';

class GetTopRatedTvSeries{
  final TvSeriesRepository repository;
  GetTopRatedTvSeries(this.repository);

  Future<Either<Failure,List<TvSeries>>> execute() {
    return repository.getTopRatedTvSeries();
  }
}