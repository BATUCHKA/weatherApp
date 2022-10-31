import "package:flutter/material.dart";
import 'package:weather_icons/weather_icons.dart';

class HomeWeatherCard extends StatelessWidget {
  final String state;
  final String country;
  final String status;
  final int celsius;
  final int icon;
  const HomeWeatherCard({
    super.key,
    required this.state,
    required this.country,
    required this.status,
    required this.celsius,
    required this.icon,
  });

  IconData getIcon(int pheno) {
    switch (pheno) {
      case 3:
        return WeatherIcons.cloud;
      case 9:
        return WeatherIcons.cloud;
      case 10:
        return WeatherIcons.cloud;
      case 24:
        return WeatherIcons.day_snow;
      case 27:
        return WeatherIcons.night_rain_mix;
      case 28:
        return WeatherIcons.day_rain_mix;
      case 71:
        return WeatherIcons.snow;
      case 5:
        return WeatherIcons.day_cloudy;
      case 7:
        return WeatherIcons.night_alt_cloudy;
      case 20:
        return WeatherIcons.cloud_down;
      case 65:
        return WeatherIcons.rain;
      case 60:
        return WeatherIcons.raindrops;
      default:
        return WeatherIcons.sunset;
    }
  }

  @override
  Widget build(BuildContext context) {
    double sWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.all(20),
      width: sWidth - 50,
      height: 150,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.deepPurple[600],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                country,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              Text(
                state,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                status,
                style: const TextStyle(
                  color: Colors.white,
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BoxedIcon(
                getIcon(icon),
                color: Colors.white,
                size: 50,
              ),
              Text(
                "$celsius˚C",
                style: const TextStyle(
                  color: Colors.white,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
