import "package:flutter/material.dart";
import 'package:weather_app/src/screen/home/components/home_weather_card.dart';

class TopThree extends StatelessWidget {
  final int pageNumber;
  final Function(int) onPageChanged;
  final data;
  final List<dynamic> topThree;
  final Function(int) addFunction;

  const TopThree({
    super.key,
    required this.pageNumber,
    required this.onPageChanged,
    required this.data,
    required this.topThree,
    required this.addFunction,
  });

  @override
  Widget build(BuildContext context) {
    if (topThree.isEmpty) {
      return const SizedBox(
        height: 170,
        child: Center(
          child: Text("You don't have liked weather"),
        ),
      );
    }
    return Column(
      children: [
        SizedBox(
          height: 170.0,
          child: PageView.builder(
            onPageChanged: (index) {
              onPageChanged(index);
            },
            scrollDirection: Axis.horizontal,
            itemCount: topThree.length,
            itemBuilder: (context, index) {
              final item = data[topThree[index]];
              return GestureDetector(
                child: HomeWeatherCard(
                  country: "Mongolia",
                  icon: item.weathers[0].pidDay,
                  state: item!.name,
                  celsius: item.weathers[0].tempDay,
                  status: item.weathers[0].dayStatus,
                ),
                onTap: () => {
                  Navigator.pushNamed(
                    context,
                    "/details",
                    arguments: {
                      "state": data[topThree[index]].name,
                      "weatherData": data[topThree[index]].weathers,
                      "dataIndex": topThree[index],
                      "addFunction": addFunction,
                      "topThreeIndex": topThree,
                      "isFav": true,
                    },
                  ),
                },
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            topThree.length,
            (index) => Container(
              margin: const EdgeInsets.all(3),
              child: Icon(
                Icons.circle,
                size: 12,
                color: pageNumber == index ? Colors.black : Colors.grey,
              ),
            ),
          ).toList(),
        ),
      ],
    );
  }
}
