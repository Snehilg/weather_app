class WeatherDataCurrent {
  final Current current;
  WeatherDataCurrent({required this.current});
  factory WeatherDataCurrent.fromJson(Map<String, dynamic> json) =>
      WeatherDataCurrent(current: Current.fromJson(json["current"]));
}

class Current {
  double? tempC;
  int? isDay;
  Condition? condition;
  int? windKph;
  int? precipMm;
  int? humidity;
  int? cloud;
  double? feelslikeC;
  int? visKm;
  int? uv;

  Current({
    this.tempC,
    this.isDay,
    this.condition,
    this.windKph,
    this.precipMm,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.visKm,
    this.uv,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        tempC: (json['temp_c'] as num?)?.toDouble(),
        isDay: json['is_day'] as int?,
        condition: json['condition'] == null
            ? null
            : Condition.fromJson(json['condition'] as Map<String, dynamic>),
        windKph: json['wind_kph'] as int?,
        precipMm: json['precip_mm'] as int?,
        humidity: json['humidity'] as int?,
        cloud: json['cloud'] as int?,
        feelslikeC: (json['feelslike_c'] as num?)?.toDouble(),
        visKm: json['vis_km'] as int?,
        uv: json['uv'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'temp_c': tempC,
        'is_day': isDay,
        'condition': condition?.toJson(),
        'wind_kph': windKph,
        'precip_mm': precipMm,
        'humidity': humidity,
        'cloud': cloud,
        'feelslike_c': feelslikeC,
        'vis_km': visKm,
        'uv': uv,
      };
}

class Condition {
  String? text;
  String? icon;

  Condition({this.text, this.icon});

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        text: json['text'] as String?,
        icon: json['icon'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'text': text,
        'icon': icon,
      };
}
