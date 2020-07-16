import 'package:flutter/material.dart';
import 'package:newspaper/provider/bookmark_provider.dart';
import 'package:newspaper/widget/bookmark_tile.dart';
import 'package:provider/provider.dart';

class BookMarkScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bookmark = Provider.of<BookMark>(context);

    bookmark.intoList();
    return Scaffold(
      appBar: AppBar(
        title: Text('bookmarks'),
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: bookmark.items == null
            ? Center(
                child: Text('NO saved items'),
              )
            : Align(
                alignment: Alignment.topCenter,
                child: ListView.builder(
                    shrinkWrap: true,
                    reverse: true,
                    itemCount: bookmark.items.length,
                    itemBuilder: (ctx, i) {
                      return BookMarkTile(
                        title: bookmark.items[i].title,
                        url: bookmark.items[i].url,
                        imageUrl: bookmark.items[i].urlToImage,
                        source: bookmark.items[i].source,
                        publishedAt: bookmark.items[i].publishedAt,
                      );
                    }),
              ),
      ),
    );
  }
}
