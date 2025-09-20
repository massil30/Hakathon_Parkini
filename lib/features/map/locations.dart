import 'package:latlong2/latlong.dart';

class ParkingLocation {
  final LatLng position;
  final String name;
  final String type; // "full", "free", or "price"
  final String? price; // Only used when type is "price"

  ParkingLocation({
    required this.position,
    required this.name,
    required this.type,
    this.price,
  });
}

List<ParkingLocation> locations = [
  ParkingLocation(
    position: LatLng(36.7525, 3.04197),
    name: "Algiers Central",
    type: "full",
  ),
  ParkingLocation(
    position: LatLng(35.6971, -0.6331),
    name: "Oran Plaza",
    type: "free",
  ),
  ParkingLocation(
    position: LatLng(34.8828, -1.3167),
    name: "Tlemcen Park",
    type: "price",
    price: "200 DA",
  ),
  ParkingLocation(
    position: LatLng(36.7667, 2.9667),
    name: "Blida Square",
    type: "full",
  ),
  ParkingLocation(
    position: LatLng(35.2083, -0.6333),
    name: "Sidi Bel Abbès",
    type: "free",
  ),
  ParkingLocation(
    position: LatLng(36.4621, 2.7387),
    name: "Médéa Central",
    type: "price",
    price: "150 DA",
  ),
  ParkingLocation(
    position: LatLng(35.4121, -0.1406),
    name: "Mascara Lot",
    type: "full",
  ),
  ParkingLocation(
    position: LatLng(36.3650, 6.6147),
    name: "Constantine Park",
    type: "free",
  ),
  ParkingLocation(
    position: LatLng(35.5667, 6.1667),
    name: "Batna Plaza",
    type: "price",
    price: "180 DA",
  ),
  ParkingLocation(
    position: LatLng(36.1900, 5.4100),
    name: "Sétif Central",
    type: "full",
  ),
  ParkingLocation(
    position: LatLng(35.4000, 7.1500),
    name: "Tébessa Lot",
    type: "free",
  ),
  ParkingLocation(
    position: LatLng(34.8500, -1.3333),
    name: "Saïda Park",
    type: "price",
    price: "120 DA",
  ),
  ParkingLocation(
    position: LatLng(36.8000, 7.1500),
    name: "Annaba Central",
    type: "full",
  ),
  ParkingLocation(
    position: LatLng(35.9333, 0.0833),
    name: "Chlef Plaza",
    type: "free",
  ),
  ParkingLocation(
    position: LatLng(36.7500, 5.0833),
    name: "Béjaïa Park",
    type: "price",
    price: "200 DA",
  ),
  ParkingLocation(
    position: LatLng(35.7000, -0.6500),
    name: "Mostaganem Lot",
    type: "full",
  ),
  ParkingLocation(
    position: LatLng(36.9000, 7.7667),
    name: "Skikda Central",
    type: "free",
  ),
  ParkingLocation(
    position: LatLng(35.4333, -0.2167),
    name: "Relizane Plaza",
    type: "price",
    price: "150 DA",
  ),
  ParkingLocation(
    position: LatLng(36.1667, 1.3333),
    name: "Tiaret Park",
    type: "full",
  ),
  ParkingLocation(
    position: LatLng(35.3833, -0.9000),
    name: "Sidi M'Hamed Lot",
    type: "free",
  ),
];
