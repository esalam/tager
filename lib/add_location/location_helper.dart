import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationHelper {

  static Future<Position> getCurrentLocation(context) async {
    bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();//هترجع true لو ال location شغال لو لا هترجع false
    if (isServiceEnabled==false) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable Location services')));
    }
    LocationPermission permission= await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
}