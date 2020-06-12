import 'package:flutter/material.dart';
import 'package:newspaper/model/weather.dart';
import 'package:newspaper/widget/headline_news_widget.dart';
import 'package:newspaper/widget/weather_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var temp;
  var currently;

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  getWeather() async {
    Weather weather = Weather();
    await weather.getWeather();
    setState(() {
      temp = weather.temp;
      currently = weather.currently;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          WeatherWidget(temp: temp, currently: currently),
          HeadlineNewsWidget(),
        ],
      ),
    ));
  }
}
