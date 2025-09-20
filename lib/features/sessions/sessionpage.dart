import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sikada/config/colors.dart';
import 'package:sikada/features/sessions/first/selection.dart';

class Sessionspage extends StatefulWidget {
  const Sessionspage({super.key});

  @override
  State<Sessionspage> createState() => _SessionspageState();
}

class _SessionspageState extends State<Sessionspage> {
  final TextEditingController _reviewController = TextEditingController();

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.to.background,
      appBar: AppBar(
        title: const Text(
          "Session",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: AppColors.to.background,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image section
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset('images/business.png', fit: BoxFit.cover),
              ),
            ),

            const SizedBox(height: 24),

            // Rating section
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: const Text(
                'Let’s set up your access. Are you using the app as an employee with a company?',
                style: TextStyle(fontSize: 14.5, fontWeight: FontWeight.w500),
              ),
            ),

            const SizedBox(height: 16),

            // Star rating
            const SizedBox(height: 24),

            // Review text field (body)

            // Submit button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Handle review submission

                  Get.to(() => const CompanySelectionPage());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.to.keyLight,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
