import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlist/watchlist.dart';

class WatchlistTvSeriesPage extends StatefulWidget {
  static const ROUTE_NAME = '/watchlist_tv_series';

  @override
  _WatchlistTvSeriesPageState createState() => _WatchlistTvSeriesPageState();
  
}

class _WatchlistTvSeriesPageState extends State<WatchlistTvSeriesPage> 
    with RouteAware {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<TvSeriesWatchlistBloc>().add(OnFetchTvSeriesWatchlist());
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPopNext() {
    context.read<TvSeriesWatchlistBloc>().add(OnFetchTvSeriesWatchlist());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TV Series Watchlist'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: 
        BlocBuilder<TvSeriesWatchlistBloc, TvSeriesWatchlistState>(
        builder: (context, state) {
          if (state is TvSeriesWatchlistLoading) {
            return const Center(
                child: CircularProgressIndicator(),
            );
          } else if (state is TvSeriesWatchlistHasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final tv = state.result[index];
                return TvSeriesCard(tv);
              },
              itemCount: state.result.length,
            );
          } else if (state is TvSeriesWatchlistEmpty) {
              return Center(
                child: Text("No watch list yet"),
              );
          } else {
            return const Center(
              key: Key('error_message'),
              child: Text('error'),
          );
        } 
      },
    ),
      ),
    );
  }
  
  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}
