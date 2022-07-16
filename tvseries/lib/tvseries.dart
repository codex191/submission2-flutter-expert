library tvseries;

///domain
///domain-usecase
export 'domain/usecase/get_now_playing_tv_series.dart';
export 'domain/usecase/get_popular_tv_series.dart';
export 'domain/usecase/get_tv_series_detail.dart';
export 'domain/usecase/get_top_rated_tv_series.dart';
export 'domain/usecase/get_tv_series_recomendations.dart';

//presentation
//presentation-bloc
export 'presentation/bloc/tv_series_detail/tv_series_detail_bloc.dart';
export 'presentation/bloc/tv_series_list/tv_series_list_bloc.dart';
export 'presentation/bloc/tv_series_popular/tv_series_popular_bloc.dart';
export 'presentation/bloc/tv_series_recommendation/tv_series_recommendation_bloc.dart';
export 'presentation/bloc/tv_series_top_rated/tv_series_top_rated_bloc.dart';
//presentation-pages
export 'presentation/pages/home_tv_series_page.dart';
export 'presentation/pages/popular_tv_series_page.dart';
export 'presentation/pages/top_rated_tv_series_page.dart';
export 'presentation/pages/tv_series_detail_page.dart';