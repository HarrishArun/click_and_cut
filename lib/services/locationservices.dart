import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class location extends StatefulWidget {
  const location({super.key});

  @override
  State<location> createState() => _locationState();
}

class _locationState extends State<location> {
  Position? position;
  String stadd = 'Fetching Location...';

  @override
  void initState() {
    super.initState();
    fetchPosition();
  }

  Future<void> fetchPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Fluttertoast.showToast(msg: 'Location Disabled');
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(msg: 'Location Access Denied');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(msg: 'Location Denied Forever');
      return;
    }

    Position currentposition = await Geolocator.getCurrentPosition();
    setState(() {
      position = currentposition;
    });

    List<Placemark> placemark = await placemarkFromCoordinates(
        currentposition.latitude, currentposition.longitude);

    setState(() {
      stadd = placemark.reversed.last.subLocality.toString() +
          " " +
          placemark.reversed.last.locality.toString();
      print("Location updated: $stadd"); // Debug print
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      stadd,
      style: TextStyle(
        fontSize: 15,
        foreground: Paint()
          ..shader = LinearGradient(
            colors: [
              Color(0xFF6f4fc1),
              Color(0xFF904088),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
      ),
    );
  }
}
