import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather/lat_lon.dart';
import 'package:geolocator/geolocator.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  double? latitude;
  double? longitude;

  @override
  void initState() {
    Geolocator.requestPermission().then((perm) {
      if (perm == LocationPermission.denied) {
        debugPrint('Location permissions are denied');
        return;
      }
      Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
          .then((position) {
        setState(() {
          latitude = position.latitude;
          longitude = position.longitude;
        });
      });
    });

    super.initState();
  }

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
          Column(
            children: [
              TextButton(
                onPressed: () => setState(() {
                  latitude = 34.1425;
                  longitude = -118.2551;
                }),
                child: const Text('Glendale, CA'),
              ),
              TextButton(
                onPressed: () => setState(() {
                  latitude = 28.5384;
                  longitude = -81.3789;
                }),
                child: const Text("Orlando, FL"),
              ),
              TextButton(
                onPressed: () => setState(() {
                  latitude = 41.8781;
                  longitude = -87.6298;
                }),
                child: const Text("Chicago, IL"),
              ),
              TextButton(
                onPressed: () => setState(() {
                  latitude = 47.6062;
                  longitude = -122.3321;
                }),
                child: const Text("Seattle, WA"),
              ),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/forecast',
              arguments: {'latitude': latitude, 'longitude': longitude});
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
