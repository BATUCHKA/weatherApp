import "package:flutter/material.dart";
import 'package:weather_app/src/screen/detail/components/detail_daily_card.dart';

class BodyDaily extends StatelessWidget {
  final String state;
  final int pageNumber;
  final Function(int) onPageChanged;
  final data;

  const BodyDaily({
    super.key,
    required this.state,
    required this.pageNumber,
    required this.onPageChanged,
    this.data,
  });

  @override
  Widget build(BuildContext context) {
    final int indexLength = data.length;
    return Container(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      child: Column(
        children: [
          Text(
            "$state," "Mongolia",
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 320,
            child: PageView.builder(
              onPageChanged: (index) {
                onPageChanged(index);
              },
              itemCount: indexLength,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return DailyCard(
                  state: state,
                  data: data[index],
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              indexLength,
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
      ),
    );
  }
}
