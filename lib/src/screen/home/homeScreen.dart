import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_news_model.dart';
import 'package:weather_app/provider/main_provider.dart';
import 'package:weather_app/src/screen/home/components/home_header_section.dart';
import 'package:weather_app/src/screen/home/components/home_topThree_section.dart';
import 'package:weather_app/src/screen/home/components/home_worldWeather_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final PageController pageController;
  late WeatherProvider provider;
  int pageNumber = 0;

  List<dynamic> indexes = [];

  Weather? weatherData;

  @override
  void initState() {
    super.initState();
    provider = Provider.of<WeatherProvider>(context, listen: false);
    fetchData();
  }

  @override
  void _pushAdd(index) {
    if (!indexes.contains(index)) {
      if (indexes.length != 3) {
        indexes.add(index);

        setState(() {});
      } else {
        print("it's full");
      }
    } else {
      indexes.remove(index);
      setState(() {});
    }
  }

  fetchData() async {
    await provider.fetchWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, data, _) {
        if (data.weatherData == null) {
          return const Scaffold(body: Text("data not found"));
        }
        // print(data.weatherData?.cities == 1 ? "lol" : "lmao");
        return Scaffold(
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                HeadHome(
                  data: data.weatherData?.cities ?? [],
                  addFunction: _pushAdd,
                ),
                TopThree(
                  data: data.weatherData?.cities,
                  pageNumber: pageNumber,
                  topThree: indexes,
                  addFunction: _pushAdd,
                  onPageChanged: (index) {
                    setState(() {
                      pageNumber = index;
                    });
                  },
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 20, bottom: 20, right: 20),
                  child: Text(
                    "Around Mongolia",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
                WorldWeather(
                  data: data.weatherData?.cities,
                  addFunction: _pushAdd,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
