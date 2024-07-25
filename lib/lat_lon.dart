import 'package:flutter/material.dart';

class LatLon extends StatelessWidget {
  const LatLon(
      {super.key, this.latitude, this.longitude, required this.setLatLon});
  final double? latitude;
  final double? longitude;
  final Function({double? lat, double? lon}) setLatLon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: (val) {
            setLatLon(lat: double.parse(val));
          },
          decoration: const InputDecoration(
            labelText: "Latitude",
          ),
        ),
        TextField(
          onChanged: (val) {
            setLatLon(lon: double.parse(val));
          },
          decoration: const InputDecoration(
            labelText: "Longitude",
          ),
        ),
        const Placeholder(
          color: Colors.red,
        ),
      ],
    );
  }
}
