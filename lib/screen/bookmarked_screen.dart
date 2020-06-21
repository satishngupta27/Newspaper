import 'package:flutter/material.dart';
import 'package:newspaper/provider/bookmark_provider.dart';
import 'package:newspaper/widget/search_tile.dart';
import 'package:provider/provider.dart';

class BookMarkScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bookmark = Provider.of<BookMark>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('bookmarks'),
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
            itemCount: bookmark.items.length,
            itemBuilder: (ctx, i) => SearchedTile(
                  title: bookmark.items[i].title,
                  url: bookmark.items[i].url,
                  imageUrl: bookmark.items[i].urlToImage,
                  source: bookmark.items[i].source,
                  publishedAt: bookmark.items[i].publishedAt,
                )),
      ),
    );
  }
}
