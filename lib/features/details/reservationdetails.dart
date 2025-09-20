import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sikada/config/colors.dart';
import 'package:sikada/features/reservation/parking.dart';
import 'package:sikada/features/sessions/car/spot.dart';
import 'package:sikada/utils/components.dart';

class ReservationDetails extends StatefulWidget {
  const ReservationDetails({Key? key}) : super(key: key);

  @override
  State<ReservationDetails> createState() => _ReservationDetailsState();
}

class _ReservationDetailsState extends State<ReservationDetails> {
  String selectedVehicle = 'Car';
  TextEditingController fromTimeController = TextEditingController();
  TextEditingController toTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Price',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Text(
                  '100DA/2 hours',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 24),

            // Select a spot button
            CommonButton(
              text: 'Select a Spot',
              onPressed: () {
                Get.to(SpotSelection());
              },
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
      backgroundColor: AppColors.to.background,
      appBar: AppBar(
        title: Text(
          'Booking Details',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Parking Image
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'images/real.jpg',
                  width: double.infinity,
                  height: 220,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16),

              // Parking Title
              Text(
                'Public parking',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),

              // Address
              Text(
                'Rue Didouche mourad...',
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              SizedBox(height: 8),

              // Parking Info Row
              Row(
                children: [
                  // Free parking spots
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.local_parking,
                          size: 14,
                          color: Colors.green,
                        ),
                        SizedBox(width: 4),
                        Text(
                          '20 free parking spot',
                          style: TextStyle(fontSize: 12, color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),

                  // Distance
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.orange[50],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.location_on, size: 14, color: Colors.orange),
                        SizedBox(width: 4),
                        Text(
                          '1.2 km',
                          style: TextStyle(fontSize: 12, color: Colors.orange),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),

                  // 24/7
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.purple[50],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.access_time, size: 14, color: Colors.purple),
                        SizedBox(width: 4),
                        Text(
                          '24/7',
                          style: TextStyle(fontSize: 12, color: Colors.purple),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16),

              // Select Vehicle
              Text(
                'Select vehicle',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),

              // Vehicle Selection
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildVehicleOption('Car', Icons.directions_car),
                  _buildVehicleOption('Truck', Icons.local_shipping),
                  _buildVehicleOption('Motor', Icons.motorcycle),
                  _buildVehicleOption('Bicycle', Icons.pedal_bike),
                ],
              ),

              SizedBox(height: 16),

              // Time
              Text(
                'Time',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),

              // From-To Row
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'From',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: 4),
                        _buildTimeField(fromTimeController),
                      ],
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'To',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: 4),
                        _buildTimeField(toTimeController),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 24),

              // Total Price
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVehicleOption(String vehicle, IconData icon) {
    bool isSelected = selectedVehicle == vehicle;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedVehicle = vehicle;
        });
      },
      child: Container(
        width: 70,
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.to.primary : Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.to.primary : Colors.grey[300]!,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.grey[600],
              size: 24,
            ),
            SizedBox(height: 8),
            Text(
              vehicle,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.white : Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeField(TextEditingController controller) {
    return TextField(
      controller: controller,
      readOnly: true,
      onTap: () async {
        final TimeOfDay? picked = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );
        if (picked != null) {
          setState(() {
            controller.text =
                '${picked.hour}:${picked.minute.toString().padLeft(2, '0')}';
          });
        }
      },
      decoration: InputDecoration(
        hintText: 'Enter your timing',
        prefixIcon: Icon(Icons.access_time, color: Colors.grey),
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 12),
      ),
    );
  }
}
