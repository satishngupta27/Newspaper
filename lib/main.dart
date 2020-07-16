import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newspaper/db/bookMarkDb.dart';
import 'package:newspaper/provider/bookmark_provider.dart';
import 'package:newspaper/widget/bottom_nav.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: NewsDatabase(),
        ),
        ChangeNotifierProvider.value(
          value: BookMark(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter News',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: BottomNav(),
      ),
    );
  }
}
