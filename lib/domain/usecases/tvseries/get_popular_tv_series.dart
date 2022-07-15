import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tvseries.dart';
import 'package:ditonton/domain/repositories/tv_series_repository.dart';

class GetPopularTv{
  final TvSeriesRepository repository;
  GetPopularTv(this.repository);

  Future<Either<Failure,List<TvSeries>>> execute() {
    return repository.getPopularTv();
  }
}