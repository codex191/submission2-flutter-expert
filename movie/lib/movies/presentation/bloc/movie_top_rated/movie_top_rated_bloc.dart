import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:movie/movie.dart';

part 'movie_top_rated_event.dart';
part 'movie_top_rated_state.dart';

class MovieTopRatedBloc extends Bloc<MovieTopRatedEvent, MovieTopRatedState> {
  final GetTopRatedMovies _getTopRatedMovies;

  MovieTopRatedBloc(this._getTopRatedMovies) : super(MovieTopRatedEmpty()) {
    on<MovieTopRatedCalled>(_MovieTopRatedCalled);
  }

  // ignore: non_constant_identifier_names
  FutureOr<void> _MovieTopRatedCalled(
    MovieTopRatedCalled event,
    Emitter<MovieTopRatedState> emit,
  ) async {
    emit(MovieTopRatedLoading());

    final result = await _getTopRatedMovies.execute();

    result.fold(
      (failure) {
        emit(MovieTopRatedError(failure.message));
      },
      (data) {
        data.isEmpty
            ? emit(MovieTopRatedEmpty())
            : emit(MovieTopRatedHasData(data));
      },
    );
  }
}