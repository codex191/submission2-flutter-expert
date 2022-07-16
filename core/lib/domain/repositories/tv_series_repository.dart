import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

abstract class TvSeriesRepository{
  Future<Either<Failure, List<TvSeries>>> getNowPlayingTvSeries();
  Future<Either<Failure, List<TvSeries>>> getPopularTv();
  Future<Either<Failure, List<TvSeries>>> getTopRatedTvSeries();
  Future<Either<Failure, TvSeriesDetail>> getTvSeriesDetail(int id);
  Future<Either<Failure, List<TvSeries>>> getTvSeriesRecommendations(int id);
  Future<Either<Failure, List<TvSeries>>> searchTvSeries(String query);
  Future<Either<Failure, String>> saveTvSeriesWatchlist(TvSeriesDetail series);
  Future<Either<Failure, String>> removeTvSeriesWatchlist(TvSeriesDetail series);
  Future<bool> IsAddedToWatchlisttvSeries(int id);
  Future<Either<Failure, List<TvSeries>>> getWatchlistTvSeries();
}