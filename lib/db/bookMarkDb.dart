import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:newspaper/model/news_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class NewsDatabase with ChangeNotifier {
  static final NewsDatabase _instance = NewsDatabase._();
  static Database _database;

  NewsDatabase._();

  factory NewsDatabase() {
    return _instance;
  }

  Future<Database> get db async {
    if (_database != null) {
      return _database;
    }
    _database = await init();
    return _database;
  }

  Future<Database> init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String dbPath = join(directory.path, 'database.db');
    var database = openDatabase(dbPath,
        version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return database;
  }

  void _onCreate(Database db, int version) {
    db.execute('''
    CREATE TABLE news(
      title TEXT PRIMARY KEY,
      urlToImage TEXT,
      url TEXT,
      source TEXT,
      publishedAt Text)
  ''');
    print("Database was created!");
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) {
    // Run migration according database versions
  }

  Future<int> addNews(News news) async {
    var client = await db;
    notifyListeners();
    return client.insert('news', news.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<News>> fetchNews() async {
    List<News> list = [];
    var client = await db;
    final Future<List<Map<String, dynamic>>> futureMaps = client.query('news');
    var maps = await futureMaps;
    if (maps.length != 0) {
      for (var news in maps) {
        list.add(News.fromDb(news));
      }
      notifyListeners();
      return list;
    }
  }

  Future<int> updateNews(News news) async {
    var client = await db;
    notifyListeners();
    return client.update('car', news.toMap(),
        where: 'id = ?',
        whereArgs: [news.title],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> removeNews(String title) async {
    var client = await db;

    var i = await client.delete('news', where: 'title = ?', whereArgs: [title]);
    print(i.toString());
    notifyListeners();
  }
}
