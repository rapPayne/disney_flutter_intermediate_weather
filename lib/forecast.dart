import 'package:flutter/material.dart';

class Forecast extends StatefulWidget {
  const Forecast({super.key});

  @override
  State<Forecast> createState() => _ForecastState();
}

class _ForecastState extends State<Forecast> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Forecast'),
        ),
        body: const Placeholder());
  }
}
/*
Other than "today", each day is 2 periods: 6am-6pm and 6pm-6am next day
periods: [
Each  period has a name, number, temp, precip %, windspeed, winddirection, icon, 
]
*/