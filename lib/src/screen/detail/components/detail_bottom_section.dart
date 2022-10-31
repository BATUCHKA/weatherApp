import "package:flutter/material.dart";
import 'package:weather_app/src/screen/detail/components/detail_card.dart';

class BtDetails extends StatelessWidget {
  final data;
  final int dayIndex;
  final Function(int) addToFav;
  final int dataIndex;
  final favIndex;
  final Function() iconChange;
  final bool click;
  final bool isFav;

  const BtDetails({
    super.key,
    this.data,
    required this.dayIndex,
    required this.addToFav,
    required this.dataIndex,
    required this.favIndex,
    required this.iconChange,
    required this.click,
    required this.isFav,
  });

  @override
  Widget build(BuildContext context) {
    double scWidth = MediaQuery.of(context).size.width;
    return Expanded(
      child: Container(
        width: scWidth,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40),
          ),
          color: Colors.deepPurple[50],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    top: 20,
                    left: 30,
                  ),
                  child: Text(
                    "Weather details:",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: DetailCard(
                    day: data[dayIndex].windDay,
                    nigth: data[dayIndex].windNight,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Add to favorite"),
                IconButton(
                  onPressed: () {
                    addToFav(dataIndex);
                    iconChange();
                  },
                  icon: click || isFav
                      ? const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      : const Icon(
                          Icons.favorite_border,
                          color: Colors.red,
                        ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
