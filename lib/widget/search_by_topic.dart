import 'package:flutter/material.dart';
import 'package:newspaper/model/news.dart';
import 'package:newspaper/widget/search_tile.dart';

class SearchByTopic extends StatefulWidget {
  final query;

  SearchByTopic(this.query);

  @override
  _SearchByTopicState createState() => _SearchByTopicState();
}

class _SearchByTopicState extends State<SearchByTopic> {
  List<News> articles = new List<News>();

  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSearchedNews(widget.query);
  }

  getSearchedNews(String query) async {
    Articles news = Articles(topic: widget.query);
    await news.getTopicNews(query);
    articles = news.article;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? Center(
            child: Container(
                height: 100, width: 100, child: Image.asset('assets/i1.gif')))
        : SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  ///blog
                  Container(
                    padding: EdgeInsets.all(16),
                    child: ListView.builder(
                        itemCount: articles.length,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, index) => SearchedTile(
                            imageUrl: articles[index].urlToImage,
                            title: articles[index].title,
                            url: articles[index].url,
                            source: articles[index].source,
                            publishedAt: articles[index].publishedAt)),
                  )
                ],
              ),
            ),
          );
  }
}
