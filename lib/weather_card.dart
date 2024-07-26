import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key, required this.weatherData});
  final Map<String, dynamic> weatherData;
  @override
  Widget build(BuildContext context) {
    var tt = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(border: Border.all(width: 2)),
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          Image.network(weatherData['icon']),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              children: [
                Text(
                    "${weatherData['name'].toString()} ${weatherData['isDaytime'] ? 'day' : 'evening'}",
                    style: tt.headlineMedium),
                Text(weatherData['shortForecast']),
                Text(
                    "${weatherData['temperature']} ${weatherData['temperatureUnit']}"),
                Text(
                    "Wind: ${weatherData['windSpeed']} from the ${weatherData['windDirection']}")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
