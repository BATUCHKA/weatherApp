import 'package:json_annotation/json_annotation.dart';
part 'weather_news_model.g.dart';

@JsonSerializable()
class Weather {
  @JsonKey(name: "Cities")
  List<WeatherNewsRequest?> cities;

  Weather({
    required this.cities,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}

@JsonSerializable()
class WeatherNewsRequest {
  @JsonKey(name: "Name")
  String? name;
  @JsonKey(name: "Weathers")
  List<WeatherDataModel>? weathers;
  @JsonKey(ignore: true)
  bool fav = false;

  WeatherNewsRequest({
    required this.name,
    required this.weathers,
  });

  factory WeatherNewsRequest.fromJson(Map<String, dynamic> json) =>
      _$WeatherNewsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherNewsRequestToJson(this);
}

@JsonSerializable()
class WeatherDataModel {
  @JsonKey(name: "Date")
  String? date;
  @JsonKey(name: "TemperatureNight")
  int? tempNight;
  @JsonKey(name: "TemperatureDay")
  int? tempDay;
  @JsonKey(name: "PhenoNight")
  String? nightStatus;
  @JsonKey(name: "PhenoDay")
  String? dayStatus;
  @JsonKey(name: "WindNight")
  int? windNight;
  @JsonKey(name: "WindDay")
  int? windDay;
  @JsonKey(name: "PhenoIDDay")
  int? pidDay;
  @JsonKey(name: "PhenoIDNight")
  int? pidNight;

  WeatherDataModel({
    required this.tempDay,
    required this.tempNight,
    required this.nightStatus,
    required this.dayStatus,
    required this.windDay,
    required this.windNight,
    required this.pidDay,
    required this.date,
    required this.pidNight,
  });

  factory WeatherDataModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDataModelToJson(this);
}
