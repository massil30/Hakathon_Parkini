import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sikada/config/colors.dart';
import 'package:sikada/features/auth/authcontroller.dart';
import 'package:sikada/features/auth/authpages/ForgetPassword.dart';
import 'package:sikada/features/auth/user_model.dart';
import 'package:sikada/pages/rootpage.dart';
import 'package:sikada/utils/dialogs.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Login",
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        leading: Container(
          margin: EdgeInsets.only(left: 16),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },

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

              // 📝 Subtitle
              const Text(
                "Sign in to your account",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),

              const SizedBox(height: 16),

              // 📱 Phone Number
              Align(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Email",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.text,
                validator: (value) => value == null || value.trim().isEmpty
                    ? 'Phone number is required'
                    : null,
                decoration: InputDecoration(
                  hintText: "Enter your phone number",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  prefixIcon: Icon(Icons.email, color: AppColors.to.primary),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 12,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.to.primary),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // 🔒 Password
              Align(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Password",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                validator: (value) => value == null || value.trim().isEmpty
                    ? 'Password is required'
                    : null,
                decoration: InputDecoration(
                  hintText: "Enter your password",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  prefixIcon: Icon(Icons.lock, color: AppColors.to.primary),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 12,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.to.primary),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ForgetPassword(phoneNumber: "0"),
                    ),
                  );
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: const Text(
                    "Forget Password?",
                    style: TextStyle(
                      color: Color.fromARGB(255, 151, 160, 142),
                      fontSize: 12,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // 🔘 Login Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    showLoadingDialog();
                    await Future.delayed(const Duration(seconds: 2));
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const RootPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.to.keyLight,
                    padding: EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text("Login", style: TextStyle(color: Colors.white)),
                ),
              ),

              const SizedBox(height: 32),
              Row(
                children: [
                  Container(
                    width: 100,
                    child: Divider(color: Colors.grey.shade300),
                  ),
                  Text('  Or Continue with  '),
                  Container(
                    width: 90,
                    child: Divider(color: Colors.grey.shade300),
                  ),
                ],
              ),

              SizedBox(height: 12),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.to.primary),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 20),

                    Image.asset('images/google.png', width: 30),

                    SizedBox(width: 20),
                    Text(
                      "Continue with Google",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.to.primary),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 20),

                    Image.asset('images/apple.png', width: 30),
                    SizedBox(width: 20),
                    Text(
                      "Continue with Apple",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              // 📝 Signup Link
              TextButton(
                onPressed: () {},
                child: Text.rich(
                  TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                    children: [
                      TextSpan(
                        text: "Sign Up",
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
}
