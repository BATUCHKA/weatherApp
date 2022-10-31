import 'dart:async';
import "package:flutter/material.dart";
import 'package:weather_app/models/weather_news_model.dart';

class HeadHome extends StatelessWidget {
  final List<WeatherNewsRequest?> data;
  final Function(int) addFunction;

  const HeadHome({super.key, required this.data, required this.addFunction});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, top: 50, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Text(
                "Hello Adrian,",
                style: TextStyle(
                  fontSize: 18,
                  height: 2,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "Discover the weather",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  height: 2,
                ),
              ),
            ],
          ),
          FloatingActionButton(
            heroTag: "searchButton",
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchBar(
                  data: data,
                  favFunction: addFunction,
                ),
              );
            },
            backgroundColor: Colors.white70,
            child: const Icon(
              Icons.search_outlined,
              size: 30,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class SearchBar extends SearchDelegate {
  final List<WeatherNewsRequest?> data;
  final Function(int) favFunction;

  SearchBar({required this.data, required this.favFunction});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> searchCity = [];
    List<int> cityIndex = [];

    for (int i = 0; i < data.length; i++) {
      var lowerCase = query.toLowerCase();
      var finalShit = data[i]?.name?.toLowerCase();

      if (finalShit!.contains(lowerCase)) {
        searchCity.add('${data[i]!.name}');
        cityIndex.add(i);
      }
    }

    print(query);

    return ListView.builder(
      itemCount: searchCity.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            searchCity[index],
          ),
          onTap: () {},
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> searchCity = [];
    List<int> cityIndex = [];

    for (int i = 0; i < data.length; i++) {
      var lowerCase = query.toLowerCase();
      var finalShit = data[i]?.name?.toLowerCase();
      if (finalShit!.contains(lowerCase)) {
        searchCity.add('${data[i]!.name}');
        cityIndex.add(i);
      }
    }

    print(searchCity);

    return ListView.builder(
      itemCount: searchCity.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            searchCity[index],
          ),
          onTap: () {
            Navigator.pushNamed(
              context,
              "/details",
              arguments: {
                "dataIndex": cityIndex[index],
                "addFunction": favFunction,
              },
            );
          },
        );
      },
    );
  }
}
