import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sikada/config/colors.dart';
import 'package:sikada/features/report/personalform.dart';
import 'package:sikada/utils/components.dart';

class MyReportsPage extends StatefulWidget {
  const MyReportsPage({super.key});

  @override
  State<MyReportsPage> createState() => _MyReportsPageState();
}

class _MyReportsPageState extends State<MyReportsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.to.background,
      appBar: AppBar(
        title: const Text('Reports history', style: TextStyle(fontSize: 20)),
        elevation: 0,
        backgroundColor: AppColors.to.background,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: AppColors.to.primary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // Submit button at the top
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.to.keyLight,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () {
                      // Navigate to submit report form
                      Get.to(() => SubmitReportFormPage());
                    },
                    child: const Text(
                      'submit a new report',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.filter_list, color: AppColors.to.primary),
                    onPressed: () {
                      // Filter functionality
                    },
                  ),
                ),
              ],
            ),
          ),

          // Reports list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: 5, // Sample data
              itemBuilder: (context, index) {
                return ReportCard(
                  ticketNumber: 'P-2025-0831${index + 4}',
                  type: 'Illegal parking',
                  location: '144 rue al Moutanabi',
                  time: '4pm',
                  status: index % 2 == 0 ? 'in review' : 'resolved',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Report Card Widget
class ReportCard extends StatelessWidget {
  final String ticketNumber;
  final String type;
  final String location;
  final String time;
  final String status;

  const ReportCard({
    Key? key,
    required this.ticketNumber,
    required this.type,
    required this.location,
    required this.time,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ticketNumber,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: status == 'in review'
                        ? Colors.amber[100]
                        : Colors.green[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      color: status == 'in review'
                          ? Colors.orange[800]
                          : Colors.green[800],
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.car_crash, size: 16, color: AppColors.to.keyLight),
                const SizedBox(width: 8),
                Text(type),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.location_on, size: 16, color: AppColors.to.keyLight),
                const SizedBox(width: 8),
                Text(location),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.access_time, size: 16, color: AppColors.to.keyLight),
                const SizedBox(width: 8),
                Text(time),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Submit Report Form Page
class SubmitReportFormPage extends StatefulWidget {
  const SubmitReportFormPage({Key? key}) : super(key: key);

  @override
  State<SubmitReportFormPage> createState() => _SubmitReportFormPageState();
}

class _SubmitReportFormPageState extends State<SubmitReportFormPage> {
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String? _selectedCategory;
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  String? _evidenceFile;

  final List<String> _categories = [
    'Illegal parking',
    'Damaged infrastructure',
    'Traffic violation',
    'Safety hazard',
    'Other',
  ];

  @override
  void dispose() {
    _locationController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.to.background,
      appBar: AppBar(
        title: const Text('Submit Report', style: TextStyle(fontSize: 20)),
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
              'Complaint Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Category dropdown
            const Text(
              'Complaint Category',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            CommonDropdown(
              items: _categories,
              value: _selectedCategory,
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value;
                });
              },
              hint: 'Select complaint category',
            ),
            const SizedBox(height: 16),

            // Location field
            const Text(
              'Location',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            CommonTextField(
              controller: _locationController,
              hint: 'Enter location',
            ),
            const SizedBox(height: 16),

            // Date & Time
            const Text(
              'Date & Time',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () => _selectDate(context),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF7F7F7),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}",
                            style: const TextStyle(fontSize: 16),
                          ),
                          const Icon(Icons.calendar_today, size: 18),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: InkWell(
                    onTap: () => _selectTime(context),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF7F7F7),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${_selectedTime.hour}:${_selectedTime.minute.toString().padLeft(2, '0')}",
                            style: const TextStyle(fontSize: 16),
                          ),
                          const Icon(Icons.access_time, size: 18),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Description
            const Text(
              'Description',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF7F7F7),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: _descriptionController,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'Describe the issue',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.all(12),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Evidence upload
            const Text(
              'Upload Evidence',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: () {
                // Handle file upload
                setState(() {
                  _evidenceFile =
                      'evidence_photo.jpg'; // Simulated file selection
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
                        _evidenceFile == null
                            ? Icons.cloud_upload
                            : Icons.check_circle,
                        size: 40,
                        color: _evidenceFile == null
                            ? Colors.grey
                            : AppColors.to.keyLight,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _evidenceFile == null
                            ? 'Tap to upload photo or document'
                            : 'File selected',
                        style: TextStyle(
                          color: _evidenceFile == null
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

            // Next button
            CommonButton(
              text: 'Next',
              onPressed: () {
                // Validate and navigate to next form
                if (_selectedCategory == null ||
                    _locationController.text.isEmpty ||
                    _descriptionController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please fill all required fields'),
                    ),
                  );
                  return;
                }

                Get.to(() => PersonalInfoFormPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Personal Information Form Page


// Report Review Page


