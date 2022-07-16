library watchlist;

///domain
//domain-usecases
export 'domain/usecase/movies/get_watchlist_movies.dart';
export 'domain/usecase/movies/get_watchlist_status.dart';
export 'domain/usecase/movies/remove_watchlist.dart';
export 'domain/usecase/movies/save_watchlist.dart';
export 'domain/usecase/tv_series/get_tv_series_watchlist_status.dart';
export 'domain/usecase/tv_series/get_watchlist_tv_series.dart';
export 'domain/usecase/tv_series/remove_watchlist_tv_series.dart';
export 'domain/usecase/tv_series/save_watchlist_tv_series.dart';

//presentation
//presentation-bloc
export 'presentation/bloc/movie/movie_watchlist_bloc.dart';
export 'presentation/bloc/tv_series/tv_series_watchlist_bloc.dart';
//presentation-pages
export 'presentation/pages/watchlist_movies_page.dart';
export 'presentation/pages/watchlist_tv_series_page.dart';
