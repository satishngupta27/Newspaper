import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:newspaper/provider/bookmark_provider.dart';
import 'package:newspaper/screen/full_articel_screen.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

class BlogTile extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String url;
  final String source;
  final String publishedAt;

  BlogTile({
    @required this.imageUrl,
    @required this.title,
    @required this.description,
    @required this.url,
    @required this.source,
    @required this.publishedAt,
  });

  @override
  _BlogTileState createState() => _BlogTileState();
}

class _BlogTileState extends State<BlogTile> {
  bool _isSaved = false;

  @override
  Widget build(BuildContext context) {
    final bookmark = Provider.of<BookMark>(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FullArticleScreen(
                      blogUrl: widget.url,
                    )));
      },
      child: Container(

        margin: EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 200,
              width: double.infinity,
              decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    widget.imageUrl,
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              widget.source,
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              widget.title,
              style: GoogleFonts.fredokaOne(
                  fontSize: 18, fontWeight: FontWeight.w100),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              widget.description,
              style: GoogleFonts.nunito(fontSize: 15, color: Colors.black54),
            ),
            SizedBox(
              height: 2,
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.watch_later,
                  size: 18,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(DateFormat.yMMMMd('en_US')
                    .format(DateTime.parse(widget.publishedAt))
                    .toString()),
                Spacer(),
                IconButton(
                  icon: _isSaved
                      ? Icon(Icons.bookmark)
                      : Icon(Icons.bookmark_border),
                  onPressed: () {
                    bookmark.addItem(widget.title, widget.url, widget.imageUrl,
                        widget.source, widget.publishedAt);
                    setState(() {
                      _isSaved = !_isSaved;
                    });
                  },
                  iconSize: 18,
                ),
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {
                    Share.share(widget.url, subject: widget.title);
                  },
                  iconSize: 18,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
