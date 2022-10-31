import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_news_model.dart';

class DioWeather {
  Future<Weather?> getWeather() async {
    try {
      final response = await Dio()
          .get("https://weather-api.endigo.vercel.app/api/v1/weather");
      final model = Weather.fromJson(response.data);
      return model;
    } on Exception catch (e) {
      print(e.toString().toUpperCase());
      return null;
    }
  }
}
