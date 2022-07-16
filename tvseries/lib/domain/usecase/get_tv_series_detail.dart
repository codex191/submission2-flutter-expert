import 'package:dartz/dartz.dart';
import 'package:core/core.dart';

class GetTvSeriesDetail{
  final TvSeriesRepository repository;
  GetTvSeriesDetail(this.repository);
  
  Future<Either<Failure,TvSeriesDetail>> execute(int id){
    return repository.getTvSeriesDetail(id);
  }
}