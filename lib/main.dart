import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sikada/config/colors.dart';
import 'package:sikada/features/details/reservationdetails.dart';
import 'package:sikada/features/legalize/legalize.dart';
import 'package:sikada/features/map/map_view.dart';
import 'package:sikada/features/report/myreports.dart';
import 'package:sikada/features/sessions/session_vm.dart';
import 'package:sikada/pages/introduction.dart';
import 'package:sikada/pages/rootpage.dart';
import 'package:sikada/test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(AppColors()); // Initialiser ton contrôleur de thème
  Get.put(SessionVM());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
      ),
      home: Intro(), // Nouvelle page initiale
    );
  }
}
