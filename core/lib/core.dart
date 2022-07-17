library core;

export 'styles/colors.dart';
export 'styles/text_styles.dart';
export 'utils/constants.dart';
export 'utils/exception.dart';
export 'utils/failure.dart';
export 'utils/state_enum.dart';
export 'utils/utils.dart';
export 'utils/ssl_pinning.dart';

//data
//data-datasources
export 'data/datasources/db/database_helper_movies.dart';
export 'data/datasources/db/database_helper_tv_series.dart';
export 'data/datasources/movie_local_data_source.dart';
export 'data/datasources/movie_remote_data_source.dart';
export 'data/datasources/tv_series_local_data_source.dart';
export 'data/datasources/tv_series_remote_data_source.dart';

//data-Models
export 'data/models/genre_model.dart';
export 'data/models/movies/movie_detail_model.dart';
export 'data/models/movies/movie_model.dart';
export 'data/models/movies/movie_response.dart';
export 'data/models/movies/movie_table.dart';
export 'data/models/tv_series/tv_series_detail_model.dart';
export 'data/models/tv_series/tv_series_model.dart';
export 'data/models/tv_series/tv_series_response.dart';
export 'data/models/tv_series/tv_series_response.dart';
export 'data/models/tv_series/tv_series_table.dart';

//data-repositories
export 'data/repositories/movie_repository_impl.dart';
export 'data/repositories/tv_series_repository_impl.dart';

//domain
//domain-entities
export 'domain/entities/genre.dart';
export 'domain/entities/movie.dart';
export 'domain/entities/movie_detail.dart';
export 'domain/entities/tv_series_detail.dart';
export 'domain/entities/tvseries.dart';

//domain-repositories
export 'domain/repositories/movie_repository.dart';
export 'domain/repositories/tv_series_repository.dart';

//presentation
//presentation-widgets
export 'presentation/widgets/card_tv_series_list.dart';
export 'presentation/widgets/movie_card_list.dart';