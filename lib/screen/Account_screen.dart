import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Text(
                        'Following',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              )),
          SwitchListTile(
            title: const Text('Light mode'),
            value: _lights,
            onChanged: (bool value) {
              setState(() {
                _lights = value;
              });
            },
            secondary: const Icon(Icons.lightbulb_outline),
          ),
          Spacer(),
          ListTile(
            title: Text('About us'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Help'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
