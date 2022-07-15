import 'package:ditonton/domain/entities/tvseries.dart';
import 'package:ditonton/domain/entities/tv_series_detail.dart';
import 'package:equatable/equatable.dart';

class TvSeriesTable extends Equatable{
  final int id;
  final String? name;
  final String? posterPath;
  final String? overview;

  TvSeriesTable({
    required this.id, 
    required this.name, 
    required this.posterPath,
    required this.overview
  });

  factory TvSeriesTable.fromEntity(TvSeriesDetail tvs) => TvSeriesTable(
      id: tvs.id,
      name: tvs.name,
      posterPath: tvs.posterPath,
      overview: tvs.overview
  );

  factory TvSeriesTable.fromMap(Map<String,dynamic> map) => TvSeriesTable(
    id: map['id'],
    name: map['name'],
    posterPath: map['posterPath'],
    overview: map['overview'],
  );

  Map<String, dynamic> toJson() =>{
    'id':id,
    'name': name,
    'posterPath':posterPath,
    'overview': overview,
  };

  TvSeries toEntity() => TvSeries.watchlist(
    id:id,
    overview: overview,
    posterPath: posterPath,
    name:name,
  );

  @override
  List<Object?> get props => [id,name,posterPath,overview];
}