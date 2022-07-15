
import 'package:ditonton/domain/entities/genre.dart';
import 'package:equatable/equatable.dart';

class TvSeriesDetail extends Equatable{
  String backdropPath;
  List<int> episodeRunTime;
  List<Genre> genres;
  int id;
  String name;
  String originalName;
  String overview;
  double popularity;
  String posterPath;
  double voteAverage;
  int voteCount;

  TvSeriesDetail({
    required this.backdropPath,
    required this.episodeRunTime,
    required this.genres,
    required this.id,
    required this.name,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.voteAverage,
    required this.voteCount,
  });

  @override
  List<Object?> get props => [
    backdropPath,
    episodeRunTime,
    genres,
    id,
    name,
    originalName,
    overview,
    popularity,
    posterPath,
    voteAverage,
    voteCount,
  ];
}