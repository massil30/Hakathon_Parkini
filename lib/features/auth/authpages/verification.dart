import 'package:flutter/material.dart';
import 'package:sikada/config/colors.dart';
import 'package:sikada/features/auth/authcontroller.dart';
import 'package:sikada/pages/rootpage.dart';
import 'package:sikada/utils/dialogs.dart';

class VerificationPage extends StatefulWidget {
  final TextEditingController fullname;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final int? age;
  final String? selectedCity;
  final String? selectedSexe;

  const VerificationPage({
    super.key,
    required this.fullname,
    required this.phoneController,
    required this.emailController,
    required this.passwordController,
    required this.age,
    required this.selectedCity,
    required this.selectedSexe,
  });

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final _formKey = GlobalKey<FormState>();
  final _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.only(left: 16),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios_new, color: AppColors.to.primary),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Verify Code",
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 18),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(fontSize: 18, color: Colors.black54),
                  children: [
                    const TextSpan(
                      text: "Please enter the code we sent to number ",
                    ),
                    TextSpan(
                      text: widget.emailController.text,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 5, 54, 8),
                        fontSize: 18, // Assure que la couleur reste la même
                      ),
                    ),
                    const TextSpan(text: " to verify your account."),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // 🔢 Code Input Field
              TextFormField(
                controller: _otpController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter verification code",
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  prefixIcon: Icon(Icons.verified, color: AppColors.to.primary),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 12,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.to.keyLight),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) => value == null || value.trim().isEmpty
                    ? 'Code is required'
                    : null,
              ),
              const SizedBox(height: 24),

              // ✅ Verify Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      //         AuthService authController = Authcontroller();
                      //       bool created = await authController.VerifyOTP(
                      //       widget.fullname.text,
                      //     widget.emailController.text,
                      //   widget.phoneController.text,
                      // widget.passwordController.text,
                      //  widget.selectedSexe.toString(),
                      //   widget.selectedCity.toString(),
                      //   _otpController.text,
                      ///  widget.age!,
                      //);

                      // Show loading dialog
                      //        if (created) {
                      //        showLoadingDialog();
                      // Wait for a moment to simulate loading
                      //      await Future.delayed(const Duration(seconds: 2));
                      // Close the loading dialog
                      //    Navigator.pop(context);
                      // Navigate to the root page
                      //  Navigator.pushReplacement(
                      //    context,
                      //  MaterialPageRoute(
                      //            builder: (context) => const RootPage(),
                      //                   ));
                      //           } else {
                      //           showErrorDialog(

                      //           "Unexpecrted Error",
                      //       );
                      //    }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.to.primary,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Verify",
                    style: TextStyle(color: Colors.white),
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
