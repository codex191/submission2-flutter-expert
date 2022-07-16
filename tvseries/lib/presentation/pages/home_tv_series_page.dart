import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search/search.dart';
import 'package:tvseries/tvseries.dart';
import 'package:about/about_page.dart';
import 'package:flutter/material.dart';
import 'package:movie/movie.dart';
import 'package:watchlist/watchlist.dart';

class HomeTvSeriesPage extends StatefulWidget {
  static const ROUTE_NAME = 'tv_series_homepage';
  @override
  _HomeTvSeriesPageState createState() => _HomeTvSeriesPageState();
}

class _HomeTvSeriesPageState extends State<HomeTvSeriesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<TvSeriesListBloc>().add(OnTvSeriesListCalled());
      context.read<TvSeriesPopularBloc>().add(OnTvSeriesPopularCalled());
      context.read<TvSeriesTopRatedBloc>().add(OnTvSeriesTopRatedCalled());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: kOxfordBlue
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/circle-g.png'),
              ),
              accountName: Text('Ditonton'),
              accountEmail: Text('ditonton@dicoding.com'),
            ),
            ListTile(
              leading: const Icon(Icons.movie),
              title: const Text('Movies'),
              onTap: () {
                Navigator.pushNamed(context, HomeMoviePage.ROUTE_NAME);
              },
            ),
            ListTile(
              leading: const Icon(Icons.tv_rounded),
              title: const Text('TV Series'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
                leading: const Icon(Icons.save_alt),
                title: const Text('Watchlist'),
                onTap: () {
                  Navigator.pushNamed(context, WatchlistTvSeriesPage.ROUTE_NAME);
                }
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, AboutPage.ROUTE_NAME);
              },
              leading: const Icon(Icons.info_outline),
              title: const Text('About'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Ditonton'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, TvSeriesSearchPage.ROUTE_NAME);
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Now Playing TV Series',
                style: kHeading6,
              ),
              BlocBuilder<TvSeriesListBloc, TvSeriesListState>(
                  builder: (context, state) {
                if (state is TvSeriesListLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is TvSeriesListHasData) {
                  return TvList(state.result);
                } else if (state is TvSeriesListEmpty) {
                  return const Center(
                    child: Text(
                      'empty',
                      key: Key('empty_message'),
                    ),
                  );
                } else {
                  return const Center(
                    child: Text(
                      'error',
                      key: Key('error_message'),
                    ),
                  );
                }
              }),
              _buildSubHeading(
                title: 'Popular TV Series',
                onTap: () => {
                    Navigator.pushNamed(context, PopularTvSeriesPage.ROUTE_NAME)},
              ),
              BlocBuilder<TvSeriesPopularBloc, TvSeriesPopularState>(
                  builder: (context, state) {
                if (state is TvSeriesPopularLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is TvSeriesPopularHasData) {
                  return TvList(state.result);
                } else if (state is TvSeriesPopularEmpty) {
                  return const Center(
                    child: Text(
                      'empty',
                      key: Key('empty_message'),
                    ),
                  );
                } else {
                  return const Text(
                    'error',
                    key: Key('error_message'),
                  );
                }
              }),
              _buildSubHeading(
                title: 'Top Rated TV Series',
                onTap: () => {
                  Navigator.pushNamed(context, TopRatedTvSeriesPage.ROUTE_NAME)},
              ),
              BlocBuilder<TvSeriesTopRatedBloc, TvSeriesTopRatedState>(
                  builder: (context, state) {
                if (state is TvSeriesTopRatedLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is TvSeriesTopRatedHasData) {
                  return TvList(state.result);
                } else if (state is TvSeriesTopRatedEmpty) {
                  return const Center(
                    child: Text(
                      'empty',
                      key: Key('empty_message'),
                    ),
                  );
                } else {
                  return const Text(
                    'error',
                    key: Key('error_message'),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildSubHeading({required String title, required Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: kHeading6,
        ),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [const Text('See More'), const Icon(Icons.arrow_forward_ios)],
            ),
          ),
        ),
      ],
    );
  }
}

class TvList extends StatelessWidget {
  final List<TvSeries> tvSeries;

  TvList(this.tvSeries);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final series = tvSeries[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context, 
                  TvSeriesDetailPage.ROUTE_NAME,
                  arguments: series.id
                );
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$BASE_IMAGE_URL${series.posterPath}',
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: tvSeries.length,
      ),
    );
  }
}
