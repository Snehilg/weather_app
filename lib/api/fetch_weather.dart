import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/api/api_key.dart';
import 'package:weather_app/model/weather_data.dart';
import 'package:weather_app/model/weather_data_current.dart';

class FetchWeather {
  WeatherData? weatherData;
  Future<WeatherData> processData(lat, long) async {
    var response = await http.get(Uri.parse(apiURL(lat, long)));
    var jsonString = jsonDecode(response.body);
    /*print(jsonString["current"]["condition"]["text"]);*/
    weatherData = WeatherData(WeatherDataCurrent.fromJson(jsonString));
    return weatherData!;
  }
}

// for returning url according to latitude and longitude
String apiURL(var lat, var long) {
  String url;
  url =
      "http://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$lat,$long&days=8&aqi=no&alerts=no";
  return url;
}

/*
url=http://api.weatherapi.com/v1/forecast.json?key=5e4ffc89719d401d824131054222509&
    q=26.4036,80.3895&days=8&aqi=no&alerts=no
*/
