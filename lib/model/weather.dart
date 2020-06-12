import 'dart:convert';

import 'package:http/http.dart' as http;

class Weather {
  var temp;
  var currently;

  Weather({this.temp, this.currently});

  Future<void> getWeather() async {
    http.Response response = await http.get(
        "http://api.openweathermap.org/data/2.5/weather?q=agra&units=metric&appid=25501d5e5e8ec27ce3e9ee2b1fb75dba");
    var results = jsonDecode(response.body);

    this.temp = results['main']['temp'];
    this..currently = results['weather'][0]['main'];
  }
}
