import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weather_app/api/dio_client.dart';
import 'package:weather_app/models/weather_news_model.dart';

class WeatherProvider extends ChangeNotifier {
  Weather? weatherData;
  bool isLoading = false;

  Future fetchWeatherData() async {
    final _dioClient = DioWeather();
    try {
      final response = await _dioClient.getWeather();
      if (response != null) {
        weatherData = response;
      }
    } catch (e, stackTrace) {
      log("errr: $e", stackTrace: stackTrace);
    }
    notifyListeners();
  }
}
