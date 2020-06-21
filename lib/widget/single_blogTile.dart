import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:newspaper/provider/bookmark_provider.dart';
import 'package:newspaper/screen/full_articel_screen.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

class BlogTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String url;
  final String source;
  final String publishedAt;

  BlogTile(
      {@required this.imageUrl,
      @required this.title,
      @required this.description,
      @required this.url,
      @required this.source,
      @required this.publishedAt});

  @override
  Widget build(BuildContext context) {
    final bookmark = Provider.of<BookMark>(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FullArticleScreen(
                      blogUrl: url,
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(imageUrl)),
            SizedBox(
              height: 6,
            ),
            Text(
              source,
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              title,
              style: GoogleFonts.fredokaOne(
                  fontSize: 18, fontWeight: FontWeight.w100),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              description,
              style: GoogleFonts.nunito(fontSize: 15, color: Colors.black54),
            ),
            SizedBox(
              height: 6,
            ),
            Row(
              children: <Widget>[
                Text(DateFormat.yMMMMd('en_US')
                    .format(DateTime.parse(publishedAt))
                    .toString()),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.bookmark_border),
                  onPressed: () {
                    bookmark.addItem(title, url, imageUrl, source, publishedAt);
                  },
                  iconSize: 18,
                ),
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {
                    Share.share(url,
                        subject: title
                    );
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
