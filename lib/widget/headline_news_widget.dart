import 'package:flutter/material.dart';
import 'package:newspaper/model/articel_model.dart';
import 'package:newspaper/model/news_model.dart';
import 'package:newspaper/widget/single_blogTile.dart';

class HeadlineNewsWidget extends StatefulWidget {
  @override
  _HeadlineNewsWidgetState createState() => _HeadlineNewsWidgetState();
}

class _HeadlineNewsWidgetState extends State<HeadlineNewsWidget> {
  List<News> articles = new List<News>();

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getHeadlineNews();
  }

  getHeadlineNews() async {
    Articles news = Articles();
    await news.getTopHeadlineNews();
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
                        itemBuilder: (context, index) => BlogTile(
                              imageUrl: articles[index].urlToImage,
                              title: articles[index].title,
                              description: articles[index].description,
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
