import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sikada/config/colors.dart';
import 'package:sikada/features/legalize/legalizationreview.dart';
import 'package:sikada/utils/components.dart';
import 'package:sikada/pages/rootpage.dart';

class LegalizationReviewPage extends StatelessWidget {
  final String legalizationReference;

  const LegalizationReviewPage({Key? key, required this.legalizationReference})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.to.background,
      appBar: AppBar(
        title: const Text(
          'Legalization Submitted',
          style: TextStyle(fontSize: 20),
        ),
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
                'Your legalization request has been submitted',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: AppColors.to.keyLight,
                ),
                textAlign: TextAlign.center,
              ),

              // Legalization reference
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  children: [
                    const Text(
                      'Thank you for your legalization request. Our team will review it shortly.',
                      style: TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
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
                      child: Column(
                        children: [
                          const Text(
                            'Legalization Reference',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            legalizationReference,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.to.keyLight,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),
              Text(
                'This usually takes less than 24 hours ⏳',
                style: TextStyle(fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 20),
              CommonButton(
                text: 'Ok',
                onPressed: () {
                  Get.offAll(() => RootPage());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
