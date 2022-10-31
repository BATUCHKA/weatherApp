import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/main_provider.dart';
import 'package:weather_app/src/screen/detail/detailScreen.dart';
import 'package:weather_app/src/screen/home/homeScreen.dart';
import 'package:weather_app/src/screen/splash/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => WeatherProvider()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          '/': (context) => SplashScreen(),
          '/home': (context) => HomeScreen(),
          '/details': (context) => DetailScreen(),
        },
      ),
    );
  }
}
