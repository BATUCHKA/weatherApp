// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      cities: (json['Cities'] as List<dynamic>)
          .map((e) => e == null
              ? null
              : WeatherNewsRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'Cities': instance.cities,
    };

WeatherNewsRequest _$WeatherNewsRequestFromJson(Map<String, dynamic> json) =>
    WeatherNewsRequest(
      name: json['Name'] as String?,
      weathers: (json['Weathers'] as List<dynamic>?)
          ?.map((e) => WeatherDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WeatherNewsRequestToJson(WeatherNewsRequest instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'Weathers': instance.weathers,
    };

WeatherDataModel _$WeatherDataModelFromJson(Map<String, dynamic> json) =>
    WeatherDataModel(
      tempDay: json['TemperatureDay'] as int?,
      tempNight: json['TemperatureNight'] as int?,
      nightStatus: json['PhenoNight'] as String?,
      dayStatus: json['PhenoDay'] as String?,
      windDay: json['WindDay'] as int?,
      windNight: json['WindNight'] as int?,
      pidDay: json['PhenoIDDay'] as int?,
      date: json['Date'] as String?,
      pidNight: json['PhenoIDNight'] as int?,
    );

Map<String, dynamic> _$WeatherDataModelToJson(WeatherDataModel instance) =>
    <String, dynamic>{
      'Date': instance.date,
      'TemperatureNight': instance.tempNight,
      'TemperatureDay': instance.tempDay,
      'PhenoNight': instance.nightStatus,
      'PhenoDay': instance.dayStatus,
      'WindNight': instance.windNight,
      'WindDay': instance.windDay,
      'PhenoIDDay': instance.pidDay,
      'PhenoIDNight': instance.pidNight,
    };
