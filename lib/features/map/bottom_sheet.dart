import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

import 'package:latlong2/latlong.dart';
import 'package:sikada/config/colors.dart';
import 'package:sikada/features/map/map_service.dart';
import 'package:sikada/features/map/map_view.dart';
import 'package:sikada/features/sessions/car/spot.dart';
import 'package:sikada/utils/components.dart';

//BottomSheet
void showBottommSheet(
  BuildContext context,
  LatLng? _current,
  LatLng _destination,
  _determine,
  function,
) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Allows more height control
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Wrap(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  width: 150, // set the width you want
                  height: 4, // thickness of divider
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20), // rounded edges
                  ),
                ),
                // Parking Card
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header with image and title
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Parking image
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            child: Image.asset(
                              'images/real.jpg',
                              width: 124,
                              height: 124,
                              fit: BoxFit.cover,
                            ),
                          ),
                          // Title and details
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Public parking",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    "rue Didouche mourad...",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  // Status indicators
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.local_parking,
                                        color: AppColors.to.keyLight,
                                        size: 16,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        "10 free parking spot",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: AppColors.to.keyLight,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 4),

                                  // Information cards
                                  Wrap(
                                    children: [
                                      // Cars count
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 6,
                                        ),
                                        margin: EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          color: Color(0xFFD4EEFF),
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons.directions_car,
                                              color: Color(0xFF0A6CAD),
                                              size: 18,
                                            ),
                                            SizedBox(width: 4),
                                            Text(
                                              "40 cars",
                                              style: TextStyle(
                                                fontSize: 9,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF0A6CAD),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 8),

                                      // Distance
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 6,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Color(0xFFE8FFDB),
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,

                                          children: [
                                            Icon(
                                              Icons.location_on,
                                              color: Color(0xFF1E8E0E),
                                              size: 18,
                                            ),
                                            SizedBox(width: 4),
                                            Text(
                                              "1.2 km",
                                              style: TextStyle(
                                                fontSize: 9,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF1E8E0E),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 8),

                                      // 24/7 availability
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 6,
                                        ),
                                        margin: EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF2E4FF),
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,

                                          children: [
                                            Icon(
                                              Icons.access_time,
                                              color: Color(0xFF7B2CBF),
                                              size: 18,
                                            ),
                                            SizedBox(width: 4),
                                            Text(
                                              "24/7",
                                              style: TextStyle(
                                                fontSize: 9,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF7B2CBF),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 12),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Divider
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: ElevatedButton(
                          onPressed: () {
                            Get.to(SpotSelection());
                            /*         var mapServices = MapServices();

                            if (_current == null) {
                              await _determine();
                              if (_current != null) {
                                await mapServices.getRoute(
                                  _current,
                                  _destination,
                                  function,
                                );
                                Navigator.pop(context);
                              }
                            } else {
                              await mapServices.getRoute(
                                _current,
                                _destination,
                                function,
                              );
                            }
                            mapController.move(_current!, 10);

                            Navigator.pop(context); */
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.to.keyLight,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: Text(
                            "Book now",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),

                      // Details button
                      SizedBox(height: 24),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}

//Description Text
Widget buildDescription(BuildContext context) {
  String longText =
      "Join us for a heartwarming Iftar Jama3i! Share the joy of breaking fast together, savor delicious meals, and strengthen community bonds. Let’s celebrate Ramadan with unity and blessings. 🕌✨ #IftarJama3i #RamadanSpirit";

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        longText,
        maxLines: 3, // Limit text to 3 lines
        overflow: TextOverflow.ellipsis, // Add "..."
        style: TextStyle(fontSize: 13.5, color: Colors.grey[700]),
      ),
    ],
  );
}
