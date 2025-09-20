import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sikada/config/colors.dart';
import 'package:sikada/pages/rootpage.dart';
import 'package:sikada/utils/components.dart';

class Reviewpage extends StatefulWidget {
  const Reviewpage({super.key});

  @override
  State<Reviewpage> createState() => _ReviewpageState();
}

class _ReviewpageState extends State<Reviewpage> {
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
        title: const Text('Review', style: TextStyle(fontSize: 20)),
        elevation: 0,
        backgroundColor: AppColors.to.background,
        centerTitle: true,
        leading: SizedBox(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 70, left: 16.0, right: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image section
              Container(
                width: double.infinity,
                height: size.height * 0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset('images/review.png', fit: BoxFit.cover),
                ),
              ),

              const SizedBox(height: 24),
              Text(
                'Your request is under review',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: AppColors.to.keyLight,
                ),
              ),
              // Rating section
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: const Text(
                  'Thanks! We’ve sent your details to Djezzy.  They’ll verify your employee code and approve your access shortly.”',
                  style: TextStyle(fontSize: 14.5, fontWeight: FontWeight.w500),
                ),
              ),

              const SizedBox(height: 16),
              Text(
                'This usually takes less than 24 hours ⏳',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),

              // Star rating
              SizedBox(height: 20),
              CommonButton(
                text: 'Ok',
                onPressed: () {
                  Get.offAll(RootPage());
                },
              ),
              // Review text field (body)
            ],
          ),
        ),
      ),
    );
  }
}
