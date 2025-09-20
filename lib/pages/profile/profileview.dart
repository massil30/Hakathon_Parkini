import 'package:flutter/material.dart';
import 'package:sikada/config/colors.dart';

class ProfileSettingsPage extends StatelessWidget {
  const ProfileSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFBFBFE),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title
              const Text(
                "Profile & Settings",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              // Profile card
              Container(
                padding: const EdgeInsets.only(
                  top: 16,
                  bottom: 20,
                  left: 100,
                  right: 100,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.shade300),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                        "https://randomuser.me/api/portraits/women/44.jpg",
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Fatima Azzouz",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Text(
                      "fatima@gmail.com",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.to.keyLight,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 10,
                        ),
                      ),
                      child: const Text(
                        "Edit",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Security Section
              sectionTitle("Security"),
              buildCategoryBlock([
                buildSettingRow(Icons.lock_outline, "Change password"),
              ]),

              const SizedBox(height: 16),

              // General Section
              sectionTitle("General"),
              buildCategoryBlock([
                buildSettingRow(Icons.language, "Languages"),
                buildSettingRow(Icons.notifications_none, "Notifications"),
                buildSettingRow(Icons.delete_sweep_outlined, "Clear Cache"),
              ]),

              const SizedBox(height: 16),

              // About Section
              sectionTitle("About"),
              buildCategoryBlock([
                buildSettingRow(Icons.help_outline, "Help and support"),
                buildSettingRow(Icons.policy_outlined, "Legacies and policies"),
              ]),

              const SizedBox(height: 24),

              // Logout button
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade300,
                  foregroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text("Logout"),
              ),

              const SizedBox(height: 12),

              // Delete account button
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade100,
                  foregroundColor: Colors.red,
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text("Delete account"),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Section title widget
  Widget sectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }

  // Category block (group of items inside one container)
  Widget buildCategoryBlock(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: List.generate(children.length, (index) {
          return Column(
            children: [
              children[index],
              if (index != children.length - 1)
                Divider(height: 1, color: Colors.grey.shade300),
            ],
          );
        }),
      ),
    );
  }

  // Single row inside a block
  Widget buildSettingRow(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      child: Row(
        children: [
          Icon(icon, color: AppColors.to.keyLight),
          const SizedBox(width: 12),
          Text(title, style: const TextStyle(fontSize: 15)),
          const Spacer(),
        ],
      ),
    );
  }
}
