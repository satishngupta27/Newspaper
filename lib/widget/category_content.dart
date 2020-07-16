import 'package:flutter/material.dart';
import 'package:newspaper/model/articel_model.dart';
import 'package:newspaper/model/news_model.dart';
import 'package:newspaper/widget/single_blogTile.dart';

class CategoryContentScreen extends StatefulWidget {
  final categoryName;

  CategoryContentScreen(this.categoryName);

  @override
  _CategoryContentScreenState createState() => _CategoryContentScreenState();
}

class _CategoryContentScreenState extends State<CategoryContentScreen> {
  List<News> articles = new List<News>();

  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoryNews(widget.categoryName);
  }

  getCategoryNews(String category) async {
    Articles news = Articles(category: widget.categoryName);
    await news.getCategoryNews(category);
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
