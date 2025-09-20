import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:sikada/config/colors.dart';
import 'package:sikada/features/reservation/parking.dart';
import 'package:sikada/features/sessions/session_vm.dart';
import 'package:sikada/utils/appbar.dart';
import 'package:sikada/utils/components.dart';

class SpotSelection extends StatefulWidget {
  const SpotSelection({super.key});

  @override
  State<SpotSelection> createState() => _SpotSelectionState();
}

class _SpotSelectionState extends State<SpotSelection> {
  String? spot;
  final SessionVM controller = Get.find<SessionVM>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.to.background,
      appBar: CustomAppBar(title: 'Select a spot'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CommonDropdown(
                hint: 'Select spot',
                items: ['Section A', 'Section B', 'Section C'],
                value: spot,
                onChanged: (value) {
                  setState(() {
                    spot = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(flex: 3, child: Image.asset('images/rightsite.png')),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        const SizedBox(height: 16),
                        Image.asset('images/arrow.png'),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      child: Image.asset('images/rightsite.png'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      // ✅ Affiche seulement si spot != null
      bottomNavigationBar: spot == null
          ? null
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 14,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Picked spot',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'Section A A18' ?? '',
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          controller.setCarParked();
                          Get.to(ParkingPage());
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 28,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          backgroundColor: const Color(0xFF00C4A7),
                        ),
                        child: const Text(
                          'Confirm',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Center(
                    child: Container(
                      width: 120,
                      height: 6,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 12,
                            spreadRadius: 2,
                            offset: const Offset(0, 4),
                          ),
                        ],
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
