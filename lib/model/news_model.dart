class News {
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String content;
  String source;
  String publishedAt;
  bool isSaved;

  News(
      {this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.content,
      this.source,
      this.publishedAt,
      this.isSaved = false});

  void _setSavedValue(bool newValue) {
    isSaved = newValue;
  }

  void toggleIsSavedStatus() {
    isSaved = !isSaved;
    ;
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'urlToImage': urlToImage,
      'url': url,
      'source': source,
      'publishedAt': publishedAt,
    };
  }

  News.fromDb(Map<String, dynamic> map)
      : title = map['title'],
        urlToImage = map['urlToImage'],
        url = map['url'],
        source = map['source'],
        publishedAt = map['publishedAt'];
}
