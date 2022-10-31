import "package:flutter/material.dart";

class HeaderButtons extends StatelessWidget {
  final dateData;
  final int dayIndex;
  const HeaderButtons({super.key, required this.dayIndex, this.dateData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30, top: 50, right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FloatingActionButton(
            heroTag: "btn1",
            backgroundColor: Colors.deepPurple[600],
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.grid_view_rounded,
            ),
          ),
          Container(
            width: 115,
            decoration: BoxDecoration(
              color: Colors.deepPurple[50],
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  dateData[dayIndex].date.split('-')[2] + "-нд",
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                FloatingActionButton(
                  heroTag: "btn2",
                  backgroundColor: Colors.deepPurple,
                  onPressed: () => {
                    Navigator.pushNamed(
                      context,
                      "/home",
                    ),
                  },
                  child: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
