import 'package:mockito/annotations.dart';
import 'package:watchlist/watchlist.dart';

@GenerateMocks([
  GetWatchlistMovies,
  GetWatchListStatus,
  RemoveWatchlist,
  SaveWatchlist,
  GetWatchListTvSeries,
  GetTvSeriesWatchListStatus,
  RemoveTvSeriesWatchlist,
  SaveTvSeriesWatchlist,
])
void main() {}