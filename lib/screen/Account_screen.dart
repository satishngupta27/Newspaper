import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newspaper/screen/bookmarked_screen.dart';
import 'package:newspaper/widget/constants.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool _lights = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
              height: 200,
              color: kGrey2,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CircleAvatar(
                      child: Text(
                        's',
                        style: GoogleFonts.roboto(fontSize: 40),
                      ),
                      backgroundColor: Colors.white,
                      radius: 50,
                    ),
                  ),
                  Text(
                    'Satish Gupta',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  )
                ],
              )),
          SwitchListTile(
            title: const Text('Dark mode'),
            value: _lights,
            onChanged: (bool value) {
              setState(() {
                _lights = value;
              });
            },
            secondary: const Icon(Icons.lightbulb_outline),
          ),
          ListTile(
            leading: Icon(Icons.library_books),
            title: Text('My Following'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.bookmark),
            title: Text('Bookmark'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => BookMarkScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.assignment_ind),
            title: Text('About us'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Help'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
