import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:search/search.dart';
import 'package:rxdart/rxdart.dart';

part 'tv_series_search_event.dart';
part 'tv_series_search_state.dart';

class SearchTvSeriesBloc
    extends Bloc<SearchTvSeriesEvent, SearchTvSeriesState> {
  final SearchTvSeries _searchTVShows;

  SearchTvSeriesBloc(this._searchTVShows) : super(SearchTvSeriesEmpty()) {
    on<OnQueryTvSeriesChange>(_onQueryTvSeriesChange);
  }

  FutureOr<void> _onQueryTvSeriesChange(
      OnQueryTvSeriesChange event, Emitter<SearchTvSeriesState> emit) async {
    final query = event.query;
    emit(SearchTvSeriesEmpty());

    final result = await _searchTVShows.execute(query);

    result.fold(
      (failure) {
        emit(SearchTvSeriesError(failure.message));
      },
      (data) {
        data.isEmpty
            ? emit(SearchTvSeriesEmpty())
            : emit(SearchTvSeriesHasData(data));
      },
    );
  }

  @override
  Stream<SearchTvSeriesState> get stream =>
      super.stream.debounceTime(const Duration(milliseconds: 200));
}