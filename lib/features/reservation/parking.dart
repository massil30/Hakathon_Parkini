import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sikada/config/colors.dart';
import 'package:sikada/features/reservation/reserved.dart';

class ParkingPage extends StatefulWidget {
  const ParkingPage({super.key});

  @override
  State<ParkingPage> createState() => _ParkingPageState();
}

class _ParkingPageState extends State<ParkingPage> {
  @override
  void initState() {
    super.initState();
    // Run after 4 seconds (only once)
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        Get.to(() => ReservedPage());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 16),
                  padding: const EdgeInsets.only(
                    left: 8,
                    right: 12,
                    bottom: 8,
                    top: 8,
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 252, 186, 186),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.arrow_back),
                      SizedBox(width: 4),
                      Text('Cancel'),
                    ],
                  ),
                ),
                const SizedBox(width: 26),
                const Text(
                  "Parking",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Car Image
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: Image.asset(
                  "images/parking.png",
                  height: MediaQuery.of(context).size.height * 0.45,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Title
            const Text(
              "We’re holding your spot...",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            // Dots indicator
            SizedBox(
              height: 100,
              child: Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                  color: AppColors.to.keyLight,
                  size: 50,
                ),
              ),
            ),

            // Bottom Text
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Please park your car in spot A24. "
                "We’ll confirm once our system detects your vehicle",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
