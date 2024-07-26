import 'package:flutter/material.dart';
import 'package:flutter_weather/weather_card.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Forecast extends StatefulWidget {
  const Forecast({super.key});

  @override
  State<Forecast> createState() => _ForecastState();
}

class _ForecastState extends State<Forecast> {
  double? latitude;
  double? longitude;
  dynamic points;
  dynamic forecast;

  @override
  void didChangeDependencies() {
    var foo =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    longitude = foo['longitude'];
    latitude = foo['latitude'];
    //var {'longitude': double? longitude, 'latitude': double? latitude} = foo;
    var url = 'https://api.weather.gov/points/$latitude,$longitude';
    var uri = Uri.parse(url);

    get(uri)
        .then((res) {
          if (res.statusCode > 399) {
            throw Exception('points: ${res.body}');
          }
          return json.decode(res.body);
        })
        .then((pts) => setState(() => points = pts))
        .then((_) => get(Uri.parse(points['properties']['forecast'])))
        .then((res) {
          if (res.statusCode > 399) {
            throw Exception('forecast: ${res.body}');
          }
          return json.decode(res.body);
        })
        .then((fc) => setState(() => forecast = fc))
        .catchError((err) => debugPrint('Error fetching: $err'));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    //print(forecast);
    if (forecast == null) return const Text('loading');
    var periods = (forecast['properties']['periods'] as List<dynamic>)
        .map((p) => p as Map<String, dynamic>);
    print(periods);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forecast'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: periods.map((p) => WeatherCard(weatherData: p)).toList(),
        ),
      ),
    );
  }
}
/*
Other than "today", each day is 2 periods: 6am-6pm and 6pm-6am next day
periods: [
Each  period has a name, number, temp, precip %, windspeed, winddirection, icon, 
]
*/