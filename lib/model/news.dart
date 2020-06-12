import 'dart:convert';

import 'package:http/http.dart' as http;

class News {
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String content;
  String source;
  String publishedAt;

  News(
      {this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.content,
      this.source,
      this.publishedAt});
}

class Articles {
  String category;
  String topic;
  String source;

  Articles({this.category, this.source, this.topic});

  List<News> article = [];

  Future<void> getTopHeadlineNews() async {
    final String url =
        'http://newsapi.org/v2/top-headlines?country=in&apiKey=813eecb86f2841be8f484dcef4759de9';
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          News articleModel = new News(
              title: element['title'],
              author: element['author'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              content: element['content'],
              source: element['source']['name'],
              publishedAt: element['publishedAt']);
          article.add(articleModel);
        }
      });
    }
  }

  Future<void> getCategoryNews(String category) async {
    final String url =
        'http://newsapi.org/v2/top-headlines?country=in&category=$category&pageSize=100&apiKey=813eecb86f2841be8f484dcef4759de9';
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          News articleModel = new News(
              title: element['title'],
              author: element['author'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              content: element['content'],
              source: element['source']['name'],
              publishedAt: element['publishedAt']);
          article.add(articleModel);
        }
      });
    }
  }

  Future<void> getTopicNews(String topic) async {
    final String url =
        'https://newsapi.org/v2/everything?q=$topic&apiKey=813eecb86f2841be8f484dcef4759de9';
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          News articleModel = new News(
              title: element['title'],
              author: element['author'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              content: element['content'],
              source: element['source']['name'],
              publishedAt: element['publishedAt']);
          article.add(articleModel);
        }
      });
    }
  }

  Future<void> getSourceNews(String source) async {
    final String url =
        'https://newsapi.org/v2/$source?apiKey=813eecb86f2841be8f484dcef4759de9';
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          News articleModel = new News(
              title: element['title'],
              author: element['author'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              content: element['content'],
              source: element['source']['name'],
              publishedAt: element['publishedAt']);
          article.add(articleModel);
        }
      });
    }
  }
}
