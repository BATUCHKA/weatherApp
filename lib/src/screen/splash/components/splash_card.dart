import 'package:flutter/material.dart';

class SplashCard extends StatelessWidget {
  const SplashCard({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      padding: EdgeInsets.all(30),
      height: 370,
      width: screenWidth - 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Explore global map if wind, weather, and ocean conditions",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          Text(
            "Planing your trip become more easier with ideate weather app, you can instantly see the whole world weather within few second",
            textAlign: TextAlign.center,
            style: TextStyle(
              // fontWeight: FontWeight.w700,
              fontSize: 13,
              color: Colors.grey[600],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/home");
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 70),
              backgroundColor: Colors.deepPurple[400],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              "Get Started",
              style: TextStyle(fontSize: 17),
            ),
          ),
        ],
      ),
    );
  }
}
