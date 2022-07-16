import 'package:dartz/dartz.dart';
import 'package:core/core.dart';

class GetTvSeriesRecommendations{
  final TvSeriesRepository repository;
  GetTvSeriesRecommendations(this.repository);

  Future<Either<Failure,List<TvSeries>>> execute(id){
    return repository.getTvSeriesRecommendations(id);
  }
}