import 'package:flutter/material.dart';
import 'package:sikada/config/colors.dart';
import 'package:sikada/pages/Home/homewidget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.to.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting Section
            Container(
              decoration: BoxDecoration(
                color: AppColors.to.primary,

                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.teal,
                                shape: BoxShape.circle,
                              ),
                              child: CircleAvatar(
                                radius: 40,
                                backgroundImage: NetworkImage(
                                  "https://randomuser.me/api/portraits/women/44.jpg",
                                ),
                              ),
                            ),
                            SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hello,',
                                  style: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  'Fatma Ahmad',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color.fromARGB(255, 49, 49, 49),
                          ),
                          child: Icon(
                            Icons.notifications,
                            color: AppColors.to.keyLight,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Secure your spot text
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        Text(
                          'Secure your spot and\ngain more time !',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            height: 1.3,
                          ),
                        ),
                        Spacer(),
                        Transform.rotate(
                          angle: 600, // in radians (π = 180°, so 0.5 ≈ 28°)
                          child: Image.asset('images/home.png', width: 150),
                        ),
                      ],
                    ),
                  ),

                  // Search Bar
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Search ... ',
                          style: TextStyle(
                            color: Colors.grey.shade300,
                            fontSize: 16,
                          ),
                        ),
                        Icon(Icons.search, color: Colors.grey[400]),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
            SizedBox(height: 12),
            Container(
              margin: EdgeInsets.only(left: 16),
              child: Text(
                'In Progress Parking To',
                style: TextStyle(
                  color: AppColors.to.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // In Progress Parking Card
            Container(
              margin: EdgeInsets.only(top: 8, bottom: 16, left: 16, right: 16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.language, color: Colors.white, size: 30),
                          SizedBox(width: 6),
                          Text(
                            'Parking didouche\n\nA18',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              height: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Open Maps',
                      style: TextStyle(
                        color: Colors.teal,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Browse Categories
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    'Browse Categories',
                    style: TextStyle(
                      color: AppColors.to.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 8),

            // Category Icons
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildCategoryItem(
                    Icons.local_parking,
                    'Park Lot',
                    Colors.teal,
                  ),
                  _buildCategoryItem(Icons.local_mall, 'Malls', Colors.teal),
                  _buildCategoryItem(Icons.apartment, 'Big Park', Colors.teal),
                  _buildCategoryItem(Icons.business, 'Compar', Colors.teal),
                ],
              ),
            ),

            SizedBox(height: 4),

            // Parking Spots List
            NearbyParkingSpotsWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(IconData icon, String label, Color color) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Icon(icon, color: AppColors.to.background, size: 28),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: AppColors.to.primary,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
