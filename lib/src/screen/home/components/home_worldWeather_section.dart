import "package:flutter/material.dart";
import 'package:weather_app/src/screen/home/components/home_weather_card.dart';

class WorldWeather extends StatelessWidget {
  final data;
  final Function(int) addFunction;

  const WorldWeather({
    super.key,
    this.data,
    required this.addFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: data.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 0,
          );
        },
        itemBuilder: (context, index) {
          final item = data[index];
          return GestureDetector(
            child: SizedBox(
              height: 190,
              child: HomeWeatherCard(
                country: "Mongolia",
                icon: item.weathers[0].pidDay,
                state: item.name,
                status: item.weathers[0].dayStatus,
                celsius: item.weathers[0].tempDay,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                "/details",
                arguments: {
                  "dataIndex": index,
                  "addFunction": addFunction,
                },
              );
            },
          );
        },
      ),
    );
  }
}
