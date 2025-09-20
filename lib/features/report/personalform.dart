import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sikada/config/colors.dart';
import 'package:sikada/features/report/myreports.dart';
import 'package:sikada/features/report/personalform.dart';
import 'package:sikada/features/report/reportreview.dart';
import 'package:sikada/utils/components.dart';

class PersonalInfoFormPage extends StatefulWidget {
  const PersonalInfoFormPage({Key? key}) : super(key: key);

  @override
  State<PersonalInfoFormPage> createState() => _PersonalInfoFormPageState();
}

class _PersonalInfoFormPageState extends State<PersonalInfoFormPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _licensePlateController = TextEditingController();
  final TextEditingController _nationalIdController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _licensePlateController.dispose();
    _nationalIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.to.background,
      appBar: AppBar(
        title: const Text(
          'Personal Information',
          style: TextStyle(fontSize: 20),
        ),
        elevation: 0,
        backgroundColor: AppColors.to.background,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: AppColors.to.primary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Form fields
            const Text(
              'Your Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // First Name
            const Text(
              'First Name',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            CommonTextField(
              controller: _firstNameController,
              hint: 'Enter your first name',
            ),
            const SizedBox(height: 16),

            // Last Name
            const Text(
              'Last Name',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            CommonTextField(
              controller: _lastNameController,
              hint: 'Enter your last name',
            ),
            const SizedBox(height: 16),

            // Phone Number
            const Text(
              'Phone Number',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            CommonTextField(
              controller: _phoneController,
              hint: 'Enter your phone number',
            ),
            const SizedBox(height: 16),

            // License Plate
            const Text(
              'License Plate Number',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            CommonTextField(
              controller: _licensePlateController,
              hint: 'Enter license plate number',
            ),
            const SizedBox(height: 16),

            // National ID
            const Text(
              'National Card Number',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            CommonTextField(
              controller: _nationalIdController,
              hint: 'Enter national card number',
            ),
            const SizedBox(height: 24),

            // Submit button
            CommonButton(
              text: 'Submit',
              onPressed: () {
                // Validate and submit
                if (_firstNameController.text.isEmpty ||
                    _lastNameController.text.isEmpty ||
                    _phoneController.text.isEmpty ||
                    _licensePlateController.text.isEmpty ||
                    _nationalIdController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please fill all required fields'),
                    ),
                  );
                  return;
                }

                // Generate a random report reference
                final reportRef =
                    'RP-${DateTime.now().year}-${(10000 + DateTime.now().millisecond).toString().substring(1)}';

                // Navigate to report review page
                Get.to(() => ReportReviewPage(reportReference: reportRef));
              },
            ),
          ],
        ),
      ),
    );
  }
}
