import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:sikada/config/colors.dart';
import 'package:sikada/features/auth/authpages/SignUp.dart';
import 'package:sikada/features/auth/authpages/login.dart';

class Intro extends StatelessWidget {
  Intro({super.key});
  final colors = AppColors.to;

  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      finishButtonText: 'Get Started',
      finishButtonTextStyle: TextStyle(color: Colors.white),
      onFinish: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: AppColors.to.background,
          shape: const RoundedRectangleBorder(
            side: BorderSide(
              color: Color.fromARGB(255, 32, 32, 32), // ✅ Stroke color
              width: 2.0, // ✅ Stroke width
            ),
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (context) => Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Get Started With XCrop",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => LoginPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.to.keyLight,
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 12),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => SignUpPage()),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: AppColors.to.keyLight,
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        );
      },

      finishButtonStyle: FinishButtonStyle(
        backgroundColor: AppColors.to.keyLight,
      ),
      controllerColor: colors.keyLight,
      totalPage: 2,
      headerBackgroundColor: colors.background, // Header background
      pageBackgroundColor: colors.background, // Main background
      speed: 1.8,
      centerBackground: true,

      background: [
        Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Image.asset('images/home.png', height: 400),
        ),

        Image.asset('images/parking.png', height: 400),
      ],
      pageBodies: [
        buildPageBody(
          context,
          title: 'Smart Parking, Simplified',
          subtitle: 'Find, reserve, and secure a spot in seconds.',
        ),

        buildPageBody(
          context,
          title: 'AI that works for you',
          subtitle:
              'Get the best parking, nearest, safest, and always available',
        ),
      ],
    );
  }

  Widget buildPageBody(
    BuildContext context, {
    required String title,
    required String subtitle,
  }) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 480),
          Container(
            margin: EdgeInsets.only(top: 24),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.to.keyLight, // Title in white
                fontSize: 24.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black, // Subtitle in white
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
