import 'package:dartz/dartz.dart';
import 'package:core/core.dart';

class GetPopularTv{
  final TvSeriesRepository repository;
  GetPopularTv(this.repository);

  Future<Either<Failure,List<TvSeries>>> execute() {
    return repository.getPopularTv();
  }
}