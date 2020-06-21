import 'package:flutter/material.dart';
import 'package:newspaper/model/news.dart';
import 'package:newspaper/widget/search_tile.dart';

class SearchBySource extends StatefulWidget {
  final query;

  SearchBySource(this.query);

  @override
  _SearchBySourceState createState() => _SearchBySourceState();
}

class _SearchBySourceState extends State<SearchBySource> {
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
    await news.getSourceNews(query);
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
        : articles == null
            ? Center(
                child: Text('No Result found!'),
              )
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
                                  publishedAt: articles[index].publishedAt,
                                )),
                      )
                    ],
                  ),
                ),
              );
  }
}
