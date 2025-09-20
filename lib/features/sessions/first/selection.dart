import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sikada/config/colors.dart';
import 'package:sikada/features/reservation/parking.dart';
import 'package:sikada/features/reservation/reserved.dart';
import 'package:sikada/features/sessions/first/reviewPage.dart';
import 'package:sikada/features/sessions/session_vm.dart';

class CompanySelectionPage extends StatefulWidget {
  const CompanySelectionPage({super.key});

  @override
  State<CompanySelectionPage> createState() => _CompanySelectionPageState();
}

class _CompanySelectionPageState extends State<CompanySelectionPage> {
  final SessionVM controller = Get.find<SessionVM>();

  final List<String> companies = [
    "Djezzy - Dar El Beida",
    "Mobilis - Hydra",
    "Ooredoo - Bab Ezzouar",
  ];

  String? selectedCompany;
  final TextEditingController idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                "Company Selection",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 30),

              // Dropdown
              const Text(
                "Select your company",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF7F7F7),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    hint: const Text("Select company"),
                    value: selectedCompany,
                    isExpanded: true,
                    items: companies.map((company) {
                      return DropdownMenuItem(
                        value: company,
                        child: Text(company),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCompany = value;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // TextField
              const Text(
                "Enter your employee ID/ code",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: idController,
                decoration: InputDecoration(
                  hintText: "Enter your ID",
                  filled: true,
                  fillColor: const Color(0xFFF7F7F7),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Confirm Button
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00E0B8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    // Handle confirm logic
                    controller.setCarAdded();
                    Get.to(Reviewpage());
                  },
                  child: const Text(
                    "Confirm",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
