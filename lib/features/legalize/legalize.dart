import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sikada/config/colors.dart';
import 'package:sikada/features/legalize/legalizationreview.dart';
import 'package:sikada/utils/components.dart';
import 'package:sikada/pages/rootpage.dart';

class Legalize extends StatefulWidget {
  const Legalize({super.key});

  @override
  State<Legalize> createState() => _LegalizeState();
}

class _LegalizeState extends State<Legalize> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _nationalCardController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  String? _proofOfOwnership;
  String? _supportingDocuments;
  String _durationRequested = '1 month';

  final List<String> _durationOptions = [
    '1 month',
    '3 months',
    '6 months',
    '1 year',
  ];

  @override
  void dispose() {
    _fullNameController.dispose();
    _nationalCardController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.to.background,
      appBar: AppBar(
        title: const Text('Legalize My Spot', style: TextStyle(fontSize: 20)),
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
            // Image section
            const SizedBox(height: 8),

            // Form fields
            const Text(
              'Legalization Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Full Name
            const Text(
              'Full Name',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            CommonTextField(
              controller: _fullNameController,
              hint: 'Enter your full name',
            ),
            const SizedBox(height: 16),

            // National Card Number
            const Text(
              'National Card Number',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            CommonTextField(
              controller: _nationalCardController,
              hint: 'Enter national card number',
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

            // Address
            const Text(
              'Address',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            CommonTextField(
              controller: _addressController,
              hint: 'Enter your address',
            ),
            const SizedBox(height: 16),

            // Duration Requested
            const Text(
              'Duration Requested',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            CommonDropdown(
              items: _durationOptions,
              value: _durationRequested,
              onChanged: (value) {
                setState(() {
                  _durationRequested = value!;
                });
              },
              hint: 'Select duration',
            ),
            const SizedBox(height: 16),

            // Proof of Ownership upload
            const Text(
              'Proof of Ownership',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: () {
                // Handle file upload
                setState(() {
                  _proofOfOwnership =
                      'ownership_proof.pdf'; // Simulated file selection
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF7F7F7),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey[300]!, width: 1),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        _proofOfOwnership == null
                            ? Icons.cloud_upload
                            : Icons.check_circle,
                        size: 40,
                        color: _proofOfOwnership == null
                            ? Colors.grey
                            : AppColors.to.keyLight,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _proofOfOwnership == null
                            ? 'Tap to upload proof of ownership'
                            : 'File selected',
                        style: TextStyle(
                          color: _proofOfOwnership == null
                              ? Colors.grey[600]
                              : AppColors.to.keyLight,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Supporting Documents upload
            const Text(
              'Supporting Documents',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: () {
                // Handle file upload
                setState(() {
                  _supportingDocuments =
                      'supporting_docs.pdf'; // Simulated file selection
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF7F7F7),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey[300]!, width: 1),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        _supportingDocuments == null
                            ? Icons.cloud_upload
                            : Icons.check_circle,
                        size: 40,
                        color: _supportingDocuments == null
                            ? Colors.grey
                            : AppColors.to.keyLight,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _supportingDocuments == null
                            ? 'Tap to upload supporting documents'
                            : 'File selected',
                        style: TextStyle(
                          color: _supportingDocuments == null
                              ? Colors.grey[600]
                              : AppColors.to.keyLight,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Submit button
            CommonButton(
              text: 'Submit',
              onPressed: () {
                // Validate and submit
                if (_fullNameController.text.isEmpty ||
                    _nationalCardController.text.isEmpty ||
                    _phoneController.text.isEmpty ||
                    _addressController.text.isEmpty ||
                    _proofOfOwnership == null ||
                    _supportingDocuments == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please fill all required fields'),
                    ),
                  );
                  return;
                }

                // Generate a random legalization reference
                final legalizationRef =
                    'LG-${DateTime.now().year}-${(10000 + DateTime.now().millisecond).toString().substring(1)}';

                // Navigate to legalization review page
                Get.to(
                  () => LegalizationReviewPage(
                    legalizationReference: legalizationRef,
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

// Legalization Review Page
