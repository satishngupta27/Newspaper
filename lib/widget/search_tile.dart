import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:newspaper/screen/full_articel_screen.dart';
import 'package:newspaper/widget/constants.dart';

class SearchedTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String url;
  final String source;
  final String publishedAt;

  SearchedTile(
      {@required this.imageUrl,
      @required this.title,
      this.description,
      @required this.url,
      @required this.source,
      @required this.publishedAt});

  @override
  Widget build(BuildContext context) {
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
          children: <Widget>[
            Row(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(source),
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
                          DateFormat.yMMMMd('en_US')
                              .format(DateTime.parse(publishedAt))
                              .toString(),
                          style: TextStyle(color: kGrey1),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(
                        imageUrl,
                        height: 100,
                        width: 120,
                        fit: BoxFit.fill,
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
