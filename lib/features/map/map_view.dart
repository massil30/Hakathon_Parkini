import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
import 'package:sikada/config/colors.dart';
import 'package:sikada/features/Ai/ai_recommendation.dart';
import 'package:sikada/features/Ai/ai_view.dart';
import 'package:sikada/features/map/bottom_sheet.dart';
import 'package:sikada/features/map/locations.dart';
import 'package:sikada/features/map/map_service.dart';

MapController mapController = MapController();

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  MapServices mapServices = MapServices();
  LatLng _destination = LatLng(35.6977, -0.6308); // Oran
  List<LatLng> _routePoints = [
    // Near Algiers
  ];
  LatLng? currentLocation;

  @override
  void initState() {
    super.initState();
    determinePosition();
  }

  Position? position;
  Future<void> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      permission = await Geolocator.requestPermission();
    }

    // Request permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return;
      }
    }

    // Get user location
    position = await Geolocator.getCurrentPosition();
    setState(() {
      currentLocation = LatLng(position!.latitude, position!.longitude);
    });
    mapController.move(currentLocation!, 10);
  }

  addini_function(_current_variable, _destination_variable) {
    mapController.move(currentLocation!, 12);

    mapServices.getRoute(_current_variable, _destination_variable, (data) {
      if (data['code'] == 'Ok') {
        final List coordinates = data['routes'][0]['geometry']['coordinates'];
        setState(() {
          _routePoints = coordinates
              .map((coord) => LatLng(coord[1], coord[0]))
              .toList();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: FloatingActionButton(
              heroTag: "btnAI", // important: unique heroTag
              onPressed: () {
                // TODO: AI proposition action
                Get.to(AiView());
              },
              child: Container(
                padding: const EdgeInsets.all(13),
                decoration: BoxDecoration(
                  color: AppColors.to.background,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.smart_toy, // AI icon
                  color: AppColors.to.keyLight,
                  size: 30,
                ),
              ),
            ),
          ),
          // AI Proposition Button
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: FloatingActionButton(
              heroTag: "btnAI", // important: unique heroTag
              onPressed: determinePosition,
              child: Container(
                padding: const EdgeInsets.all(13),
                decoration: BoxDecoration(
                  color: AppColors.to.background,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.location_on, // AI icon
                  color: AppColors.to.keyLight,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              initialCenter: currentLocation ?? LatLng(36.752887, 3.042048),
              initialZoom: 7.0,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: ['a', 'b', 'c'],
              ),
              PolylineLayer(
                polylines: [
                  Polyline(
                    points: _routePoints,
                    strokeWidth: 5,
                    color: AppColors.to.primary,
                  ),
                ],
              ),
              //All Locations
              lcoations((data) {
                if (data['code'] == 'Ok') {
                  final List coordinates =
                      data['routes'][0]['geometry']['coordinates'];
                  setState(() {
                    _routePoints = coordinates
                        .map((coord) => LatLng(coord[1], coord[0]))
                        .toList();
                  });
                }
              }),

              MarkerLayer(
                markers: [
                  if (currentLocation != null)
                    Marker(
                      point: currentLocation!,
                      width: 80,
                      height: 80,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: AppColors.to.primary,
                            ),
                            child: Text(
                              "Me",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.location_on,
                            color: AppColors.to.primary,
                            size: 50,
                          ),
                        ],
                      ),
                    ), // Empty widget when _origin is null
                ],
              ),
            ],
          ),
          Positioned(
            top: 40,
            left: 16,
            right: 16,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: Icon(Icons.search, color: AppColors.to.primary),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }

  InkWell lcoations(var function) {
    return InkWell(
      child: MarkerLayer(
        markers: locations
            .map(
              (location) => Marker(
                width: 120,
                height: 80,
                point: location.position,
                child: InkWell(
                  onTap: () {
                    var mapServices = MapServices();
                    get_b_rout() {
                      mapServices.getRoute(
                        currentLocation,
                        location.position,
                        function,
                      );
                    }

                    showBottommSheet(
                      context,
                      currentLocation,
                      location.position,
                      determinePosition,
                      function,
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: location.type == "full"
                              ? Colors.red
                              : location.type == "free"
                              ? Colors.green
                              : Colors.orange,
                        ),
                        child: Text(
                          location.type == "price"
                              ? location.price ?? ""
                              : location.type == "full"
                              ? "Full"
                              : "Free",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Text(
                        location.name,
                        style: TextStyle(
                          color: location.type == "full"
                              ? Colors.red
                              : location.type == "free"
                              ? Colors.green
                              : Colors.orange,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Icon(
                        Icons.location_on,
                        color: location.type == "full"
                            ? Colors.red
                            : location.type == "free"
                            ? Colors.green
                            : Colors.orange,
                        size: 30,
                      ),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
