part of 'movie_detail_bloc.dart';

abstract class MovieDetailEvent extends Equatable {
  const MovieDetailEvent();
}
class OnMovieDetailCalled extends MovieDetailEvent {
  final int id;

  OnMovieDetailCalled(this.id);

  @override
  List<Object> get props => [];
}