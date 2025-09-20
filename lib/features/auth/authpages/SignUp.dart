import 'package:flutter/material.dart';
import 'package:sikada/config/colors.dart';
import 'package:sikada/pages/rootpage.dart';
import 'package:sikada/utils/dialogs.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _licensePlateController = TextEditingController();
  final _nationalCardController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Sign Up",
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        leading: Container(
          margin: const EdgeInsets.only(left: 16),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios_new, color: AppColors.to.primary),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              const Text(
                "Create your account",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 16),

              // Full Name
              _buildLabel("Full Name"),
              _buildTextField(
                _fullNameController,
                "Enter your full name",
                Icons.person,
                TextInputType.text,
              ),
              const SizedBox(height: 16),

              // Phone Number
              _buildLabel("Phone Number"),
              _buildTextField(
                _phoneController,
                "Enter your phone number",
                Icons.phone,
                TextInputType.phone,
              ),
              const SizedBox(height: 16),

              // License Plate
              _buildLabel("License Plate Number"),
              _buildTextField(
                _licensePlateController,
                "Enter your license plate number",
                Icons.car_rental,
                TextInputType.text,
              ),
              const SizedBox(height: 16),

              // National Card
              _buildLabel("National Card Number"),
              _buildTextField(
                _nationalCardController,
                "Enter your national card number",
                Icons.credit_card,
                TextInputType.number,
              ),
              const SizedBox(height: 16),

              // Password
              _buildLabel("Password"),
              _buildPasswordField(_passwordController, "Enter your password"),
              const SizedBox(height: 16),

              // Confirm Password
              _buildLabel("Confirm Password"),
              _buildPasswordField(
                _confirmPasswordController,
                "Confirm your password",
                confirm: true,
              ),
              const SizedBox(height: 24),

              // Sign Up Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      if (_passwordController.text !=
                          _confirmPasswordController.text) {
                        showErrorDialog("Passwords do not match");
                        return;
                      }

                      showLoadingDialog();
                      await Future.delayed(const Duration(seconds: 2));
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RootPage(),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.to.keyLight,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 24),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text.rich(
                  TextSpan(
                    text: "Already have an account? ",
                    style: const TextStyle(color: Colors.black54, fontSize: 14),
                    children: [
                      TextSpan(
                        text: "Login",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: AppColors.to.keyLight,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget for labels
  Widget _buildLabel(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
      ),
    );
  }

  // Widget for normal text fields
  Widget _buildTextField(
    TextEditingController controller,
    String hint,
    IconData icon,
    TextInputType type,
  ) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      validator: (value) =>
          value == null || value.trim().isEmpty ? '$hint is required' : null,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        prefixIcon: Icon(icon, color: AppColors.to.primary),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 12,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.to.primary),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  // Widget for password fields
  Widget _buildPasswordField(
    TextEditingController controller,
    String hint, {
    bool confirm = false,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: true,
      validator: (value) =>
          value == null || value.trim().isEmpty ? '$hint is required' : null,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        prefixIcon: Icon(Icons.lock, color: AppColors.to.primary),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 12,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.to.primary),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
