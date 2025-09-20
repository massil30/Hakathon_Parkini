import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sikada/config/colors.dart';
import 'package:sikada/features/Ai/ai_recommendation.dart';
import 'package:sikada/features/reservation/reserved.dart';

class AiView extends StatelessWidget {
  const AiView({super.key});

  @override
  Widget build(BuildContext context) {
    // Run after 4 seconds
    Future.delayed(const Duration(seconds: 4), () {
      Get.to(() => AiRecommendation()); // navigate with GetX
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
                const SizedBox(width: 60),
                const Text(
                  "Ai",
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
                  "images/ai.png", // put your car image in assets
                  height: MediaQuery.of(context).size.height * 0.45,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Title
            const Text(
              "Finding the best parking for you…",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
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
                "We’re analyzing availability, distance, and security in real time ",
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
