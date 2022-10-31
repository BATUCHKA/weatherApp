import "package:flutter/material.dart";
import 'package:weather_icons/weather_icons.dart';

class DetailCard extends StatelessWidget {
  final int day;
  final int nigth;
  const DetailCard({super.key, required this.day, required this.nigth});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: 170,
      height: 190,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.deepPurple[50],
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Colors.deepPurple,
                    shape: BoxShape.circle,
                  ),
                  child: const BoxedIcon(
                    WeatherIcons.day_windy,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  "Wind",
                ),
                const SizedBox(
                  width: 15,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Text("Day:"),
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                      color: Colors.deepPurple,
                      shape: BoxShape.circle,
                    ),
                    child: Column(
                      children: [
                        Text(
                          "$day",
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          "mph",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text("Nigth:"),
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                      color: Colors.deepPurple,
                      shape: BoxShape.circle,
                    ),
                    child: Column(
                      children: [
                        Text(
                          "$nigth",
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          "mph",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
