import 'package:core/core.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([
  MovieRepository,
  MovieRemoteDataSource,
  MovieLocalDataSource,
  DatabaseHelper,
  DatabaseHelperTvSeries,
  TvSeriesRepository,
  TvSeriesRemoteDataSource,
  TvSeriesLocalDataSource,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient),
  MockSpec<SSLPinningClient>(as: #MockSSLPinningClient)
])
void main() {}
