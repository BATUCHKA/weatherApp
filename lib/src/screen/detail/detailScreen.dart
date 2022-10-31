import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_news_model.dart';
import 'package:weather_app/provider/main_provider.dart';
import 'package:weather_app/src/screen/detail/components/detail_bodyDaily_section.dart';
import 'package:weather_app/src/screen/detail/components/detail_bottom_section.dart';
import 'package:weather_app/src/screen/detail/components/detail_header_section.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Weather? weatherData;
  int pageNumber = 0;

  bool clicked = false;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WeatherProvider>(context, listen: false);
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>;
    final index = arguments['dataIndex'] as int;
    final data = provider.weatherData?.cities[index];
    final state = data?.name ?? "";
    final weatherData = data?.weathers ?? [];
    final isFav = data?.fav ?? false;
    return Scaffold(
      body: Column(
        children: [
          HeaderButtons(
            dateData: weatherData,
            dayIndex: pageNumber,
          ),
          BodyDaily(
            state: state,
            pageNumber: pageNumber,
            data: weatherData,
            onPageChanged: (index) {
              setState(() {
                pageNumber = index;
              });
            },
          ),
          BtDetails(
              isFav: isFav,
              data: weatherData,
              dayIndex: pageNumber,
              dataIndex: arguments["dataIndex"],
              addToFav: arguments["addFunction"],
              favIndex: arguments["topThreeIndex"],
              click: clicked,
              iconChange: () {
                final currentFav =
                    provider.weatherData?.cities[index]?.fav ?? false;
                provider.weatherData?.cities[index]?.fav = !currentFav;
                setState(() {});
              }),
        ],
      ),
    );
  }
}
