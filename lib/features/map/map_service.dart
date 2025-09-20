import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:latlong2/latlong.dart';

class MapServices {
  //Exact Routing
  Future<void> getRoute(_origin, _destination, function(data)) async {
    final url =
        'http://router.project-osrm.org/route/v1/driving/'
        '${_origin.longitude},${_origin.latitude};'
        '${_destination.longitude},${_destination.latitude}'
        '?overview=full&geometries=geojson';

    final response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body);

    function(data);
  }

  Future<LatLng> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    Position? current;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print("Location services are disabled.");
      permission = await Geolocator.checkPermission();
    }

    // Check for permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print("Location permission denied.");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print("Location permission permanently denied.");
    }

    // Get current position

    current = await Geolocator.getCurrentPosition();

    LatLng origin = LatLng(current.longitude, current.latitude);
    return origin;
  }
}
