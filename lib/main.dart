import 'package:flutter/material.dart';
import 'package:flutter_weather/forecast.dart';
import 'package:flutter_weather/location.dart';
import './app_theme.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      theme: appTheme,
      routes: {
        '/': (ctx) => const Location(),
        '/forecast': (ctx) => const Forecast(),
      },
    );
  }
}
