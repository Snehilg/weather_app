import 'package:weather_app/model/weather_data_current.dart';

class WeatherData {
  final WeatherDataCurrent? currentWeather;
  WeatherData([this.currentWeather]);

  WeatherDataCurrent getCurrentWeather() => currentWeather!;
}
