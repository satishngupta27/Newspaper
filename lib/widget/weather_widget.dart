import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherWidget extends StatelessWidget {
  final temp;
  final currently;
  final time = DateTime.now().hour;

  WeatherWidget({this.temp, this.currently});

  wishMe(var time) {
    if (time >= 5 && time < 12) {
      return 'Good Morning';
    } else if (time >= 12 && time < 17) {
      return 'Good Afternoon';
    } else if (time >= 17 && time < 21) {
      return 'Good Evening';
    } else {
      return 'Good Night';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  wishMe(time),
                  style: GoogleFonts.nunito(fontSize: 20),
                ),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                    alignment: Alignment.topRight,
                    child: Text(
                      temp != null ? temp.toString() + "\u00b0" : "loading",
                      style: GoogleFonts.nunito(fontSize: 25),
                    )),
                Container(
                    alignment: Alignment.topRight,
                    child: Text(
                      currently != null ? currently.toString() : "loading",
                      style: GoogleFonts.nunito(fontSize: 16),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
