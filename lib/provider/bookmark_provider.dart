import 'package:flutter/material.dart';
import 'package:newspaper/db/bookMarkDb.dart';
import 'package:newspaper/model/news_model.dart';

class BookMark with ChangeNotifier {
  List<News> _items = [];

  set items(List<News> value) {
    _items = value;
  }

  int itemCount() {
    return _items.length;
  }

  List<News> get items => _items;

  void addItem(String title, String url, String urlToImage, String source,
      String publishedAt) {
    NewsDatabase newsDatabase = NewsDatabase();
    News news = News(
        title: title,
        urlToImage: urlToImage,
        url: url,
        source: source,
        publishedAt: publishedAt);

    newsDatabase.addNews(news);
    //items.add(news);
    intoList();
    notifyListeners();
  }

  Future<void> intoList() async {
    NewsDatabase newsDatabase = NewsDatabase();
    var res = await newsDatabase.fetchNews();
    items = res;
    notifyListeners();
  }
}
