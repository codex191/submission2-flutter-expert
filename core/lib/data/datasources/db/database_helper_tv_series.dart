import 'dart:async';
import 'package:core/core.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelperTvSeries {
  static DatabaseHelperTvSeries? _databaseHelper;
  DatabaseHelperTvSeries._instance() {
    _databaseHelper = this;
  }

  factory DatabaseHelperTvSeries() => _databaseHelper ?? DatabaseHelperTvSeries._instance();

  static Database? _database;

  Future<Database?> get database async {
    _database ??= await _initDb();
    return _database;
  }

  static const String _tblWatchlistTvSeries = 'tvserieswatchlist';

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/ditonton-tvseries.db';

    var db = await openDatabase(databasePath, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE  $_tblWatchlistTvSeries (
        id INTEGER PRIMARY KEY,
        name TEXT,
        overview TEXT,
        posterPath TEXT
      );
    ''');
  }

  Future<int> insertTvSeriesWatchlist(TvSeriesTable tvsTable) async {
    final db = await database;
    return await db!.insert(_tblWatchlistTvSeries, tvsTable.toJson());
  }

  Future<int> removeTvSeriesWatchlist(TvSeriesTable tvsTable) async {
    final db = await database;
    return await db!.delete(
      _tblWatchlistTvSeries,
      where: 'id = ?',
      whereArgs: [tvsTable.id],
    );
  }

  Future<Map<String, dynamic>?> getTvSeriesById(int id) async {
    final db = await database;
    final results = await db!.query(
      _tblWatchlistTvSeries,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> getWatchlistTvSeries() async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db!.query(_tblWatchlistTvSeries);
    return results;
  }
}