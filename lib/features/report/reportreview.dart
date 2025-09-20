import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sikada/config/colors.dart';
import 'package:sikada/features/report/myreports.dart';
import 'package:sikada/pages/Home/homepage.dart';
import 'package:sikada/utils/components.dart';

class ReportReviewPage extends StatelessWidget {
  final String reportReference;

  const ReportReviewPage({Key? key, required this.reportReference})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.to.background,
      appBar: AppBar(
        title: const Text('Report Submitted', style: TextStyle(fontSize: 20)),
        elevation: 0,
        backgroundColor: AppColors.to.background,
        centerTitle: true,
        leading: SizedBox(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 16.0, right: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Image section
              Container(
                width: double.infinity,
                height: size.height * 0.3,

                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset('images/completed.png'),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: AppColors.to.keyLight.withOpacity(0.3),
                  ),
                ),
                child: Row(
                  children: [
                    const Text(
                      'Report Reference:   ',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      reportReference,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.to.keyLight,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Your report has been submitted',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: AppColors.to.keyLight,
                ),
                textAlign: TextAlign.center,
              ),

              // Report reference
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  children: [
                    const Text(
                      'Thank you for your report. Our team will review it shortly.',
                      style: TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),
              Text(
                'You can track your report status in the My Reports section',
                style: TextStyle(fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 20),
              CommonButton(
                text: 'Ok',
                onPressed: () {
                  Get.offAll(() => HomePage());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
