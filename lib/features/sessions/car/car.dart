import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sikada/config/colors.dart';
import 'package:sikada/features/sessions/car/spot.dart';
import 'package:sikada/features/sessions/first/selection.dart';
import 'package:sikada/utils/components.dart';

class Carpage extends StatefulWidget {
  const Carpage({super.key});

  @override
  State<Carpage> createState() => _CarpageState();
}

class _CarpageState extends State<Carpage> {
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
          "Sessions",
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Image section
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset('images/car.png', fit: BoxFit.cover),
              ),
            ),

            const SizedBox(height: 24),

            // Rating section
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: const Text(
                'Are you arriving with your usual car?',
                style: TextStyle(fontSize: 14.5, fontWeight: FontWeight.w500),
              ),
            ),

            // Star rating
            const SizedBox(height: 24),

            // Review text field (body)

            // Submit button
            CommonButton(
              text: 'Yes',
              onPressed: () {
                Get.to(SpotSelection());
              },
            ),
            SizedBox(height: 16),
            CommonButton(
              text: 'No',
              onPressed: () {
                Get.to(() => const AddLPN());
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AddLPN extends StatefulWidget {
  const AddLPN({super.key});

  @override
  State<AddLPN> createState() => _AddLPNState();
}

TextEditingController licensePlateController = TextEditingController();
bool isChecked = true;

class _AddLPNState extends State<AddLPN> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        backgroundColor: AppColors.to.background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back Button
                InkWell(
                  onTap: () => Navigator.pop(context),
                  borderRadius: BorderRadius.circular(50),
                  child: const CircleAvatar(
                    radius: 20,
                    backgroundColor: Color(0xFFF5F5F5),
                    child: Icon(Icons.arrow_back, color: Colors.black),
                  ),
                ),
                const SizedBox(height: 20),

                // Title
                const Text(
                  "Add LPN",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 30),

                // Dropdown

                // TextField
                const Text(
                  "License Plate Number",
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                const SizedBox(height: 8),

                CommonTextField(
                  controller: licensePlateController,
                  hint: "Enter the number ",
                ),
                const SizedBox(height: 30),
                CommonButton(text: 'Add car', onPressed: () {}),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value ?? false;
                        });
                      },
                      shape: const CircleBorder(), // 👈 makes it circular
                      activeColor: AppColors.to.keyLight, // color when checked
                      checkColor: Colors.white, // check mark color
                    ),
                    const Text("Remember me", style: TextStyle(fontSize: 16)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
