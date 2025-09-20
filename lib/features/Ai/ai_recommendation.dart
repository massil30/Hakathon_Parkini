import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sikada/config/colors.dart';
import 'package:sikada/features/details/parkingdetails.dart';
import 'package:sikada/features/reservation/parking.dart';
import 'package:sikada/features/sessions/car/spot.dart';
import 'package:sikada/utils/components.dart';

class AiRecommendation extends StatefulWidget {
  const AiRecommendation({super.key});

  @override
  State<AiRecommendation> createState() => _AiRecommendationState();
}

class _AiRecommendationState extends State<AiRecommendation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'AI recommendation',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
            // Best Choice Banner
            // Card Content
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.to.keyLight),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Best Choice Banner
                  Center(
                    child: Container(
                      width: 250,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFF00D9BB),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                      ),
                      child: Text(
                        'Best Choice for You',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 24),
                  // Parking Image
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'images/real.jpg',
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),

                  // Parking Title
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),

                    child: Text(
                      'Public parking',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 4),

                  // Address
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Rue Didouche mourad...',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ),
                  SizedBox(height: 16),

                  // Parking Info Row
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),

                    child: Row(
                      children: [
                        // Free parking spots
                        Icon(
                          Icons.local_parking,
                          color: Colors.green,
                          size: 20,
                        ),
                        SizedBox(width: 4),
                        Text(
                          '20 free parking spot',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.green,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(),

                        // Distance
                        Icon(
                          Icons.directions_car,
                          color: AppColors.to.keyLight,
                          size: 20,
                        ),
                        SizedBox(width: 4),
                        Text(
                          '0.2 km',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                        ),
                        SizedBox(width: 8),

                        // 24/7
                        Text(
                          '24/7',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),

                  // Feature Icons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildFeatureIcon(Icons.access_time, '24/7'),
                      _buildFeatureIcon(Icons.attach_money, '100DA'),
                      _buildFeatureIcon(Icons.shield, 'Secure'),
                    ],
                  ),
                  SizedBox(height: 8),

                  // Book Now Button
                  Container(
                    margin: EdgeInsets.all(16),
                    child: CommonButton(
                      text: "Book now",
                      onPressed: () {
                        Get.to(ParkingDetails());
                        Get.to(() => SpotSelection());
                      },
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
  }

  Widget _buildFeatureIcon(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Icon(icon, color: AppColors.to.keyLight, size: 24),
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 14, color: Colors.grey[700])),
      ],
    );
  }
}
