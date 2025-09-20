import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sikada/features/sessions/session_vm.dart';
import 'package:sikada/pages/rootpage.dart';
import 'package:sikada/utils/components.dart';

class ReservedPage extends StatelessWidget {
  ReservedPage({super.key});
  final SessionVM controller = Get.find<SessionVM>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Parking",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              // Car Image
              Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: Stack(
                    children: [
                      Image.asset(
                        "images/parking.png", // put your car image in assets
                        height: MediaQuery.of(context).size.height * 0.45,
                        fit: BoxFit.contain,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 60,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Title
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                  "Spot A18 is now reserved under your name !",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),

              // Bottom Text
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                child: Text(
                  "Have a great day at work 🚀",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ),
              CommonButton(
                text: 'View My Parking',
                onPressed: () {
                  controller.setCarParked();
                  Get.to(RootPage());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
