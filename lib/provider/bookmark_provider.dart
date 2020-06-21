import 'package:flutter/material.dart';
import 'package:newspaper/model/news.dart';

class BookMark with ChangeNotifier {
  List<News> _items = [];

  int itemcount() {
    return _items.length;
  }

  List<News> get items => _items;

  void addItem(String title, String url, String urlToImage, String source,
      String publishedAt) {
    News news = News(
        title: title,
        urlToImage: urlToImage,
        url: url,
        source: source,
        publishedAt: publishedAt);
    items.add(news);
    notifyListeners();
  }

  void remove(String title) {
    items.removeWhere((element) => element.title == title);
    notifyListeners();
  }
}
