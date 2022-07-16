import 'package:dartz/dartz.dart';
import 'package:core/core.dart';

class GetNowPlayingTvSeries{
  final TvSeriesRepository repository;
  GetNowPlayingTvSeries(this.repository);

  Future<Either<Failure,List<TvSeries>>> execute(){
    return repository.getNowPlayingTvSeries();
  }
}