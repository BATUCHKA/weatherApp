import "package:flutter/material.dart";
import 'package:weather_icons/weather_icons.dart';

class DailyCard extends StatelessWidget {
  final String state;
  final data;
  const DailyCard({
    super.key,
    required this.state,
    required this.data,
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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 70),
      height: 350,
      width: 230,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(35),
                  topLeft: Radius.circular(35),
                ),
                color: Colors.deepPurple[200],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "${data.tempDay}˚C",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                        ),
                      ),
                      BoxedIcon(
                        getIcon(data.pidDay),
                        color: Colors.white,
                        size: 55,
                      ),
                    ],
                  ),
                  Text(
                    data.dayStatus,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
                color: Colors.deepPurple[800],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "${data.tempNight}˚C",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                        ),
                      ),
                      BoxedIcon(
                        getIcon(data.pidNight),
                        color: Colors.white,
                        size: 55,
                      ),
                    ],
                  ),
                  Text(
                    data.nightStatus,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
