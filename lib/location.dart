import 'package:flutter/material.dart';
import 'package:flutter_weather/lat_lon.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  double? latitude;
  double? longitude;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter location ($latitude, $longitude)'),
      ),
      body: Column(
        children: [
          LatLon(
            latitude: latitude,
            longitude: longitude,
            setLatLon: setLatLon,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/forecast');
        },
        child: Icon(Icons.next_plan),
      ),
    );
  }

  /// Sets the latitude and/or the longitude
  ///
  /// If either is null, it reverts to the existing value so with this one
  /// function you can set each value independantly.
  /// ```dart
  /// setLatLon(lat: -100); // Does not change longitude
  /// setLatLon(lon: 56); // Doesn't change latitude
  /// setLatLon(lon: 56, lat: -100); // Sets both
  /// ```
  void setLatLon({double? lat, double? lon}) {
    setState(() {
      latitude = lat ?? latitude;
      longitude = lon ?? longitude;
    });
  }
}
