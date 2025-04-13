import 'package:flutter/material.dart';
import 'package:vire_glof/assets.dart';
import 'package:vire_glof/colors.dart';
import 'package:vire_glof/res/commonWidgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 60),
          Card(
            child: Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      'https://th.bing.com/th/id/OIP.NqY3rNMnx2NXYo3KJfg43gHaHa?rs=1&pid=ImgDetMain',
                    ),
                  ),
                  const SizedBox(height: 10),
                  commonText("Muhammad Zidane", size: 18.0, isBold: true),
                  const SizedBox(height: 4),
                  commonText(
                    "Handicap: 12.5",
                    size: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(height: 4),
                  commonText(
                    "Avid golfer looking to improve my game!",
                    size: 12.0,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Divider(thickness: 1),
          Expanded(
            child: Container(
              height: double.minPositive,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildMenuItem("Edit Profile", ImagePaths.profileEditIcon),
                  _buildMenuItem(
                    "General Settings",
                    ImagePaths.profileSettingsIcon,
                  ),
                  _buildMenuItem(
                    "Privacy Policy",
                    ImagePaths.profilePrivacypolicyIcon,
                  ),
                  _buildMenuItem(
                    "Terms and Condition",
                    ImagePaths.profiletreamsAndAboutUsIcon,
                  ),
                  _buildMenuItem(
                    "About Us",
                    ImagePaths.profiletreamsAndAboutUsIcon,
                  ),
                  _buildMenuItem("Contact Us", ImagePaths.profileContactUsIcon),
                ],
              ),
            ),
          ),

          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 6,
                  offset: const Offset(0, 6),
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 6,
                  offset: const Offset(-6, 0),
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 6,
                  offset: const Offset(0, 6),
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 6,
                  offset: const Offset(6, 0),
                ),
              ],
            ),
            child: ListTile(
              leading: Icon(Icons.logout, color: AppColors.yellow),
              title: commonText("Log Out", size: 16.0),
              onTap: () {
                showLogoutDialog(context, () {});
              },
            ),
          ),

          SizedBox(height: 20),
        ],
      ),
    );
  }

  Future<void> showLogoutDialog(
    BuildContext context,
    VoidCallback onDelete,
  ) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: commonText(
            "Do you want to logout your profile?",
            size: 18,
            textAlign: TextAlign.center,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          actions: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppColors.green),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: commonButton(
                      "No",
                      color: Colors.transparent,
                      textColor: Colors.black,

                      height: 40,
                      width: 100,
                      onTap: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: commonButton(
                    "Yes",
                    color: AppColors.green,
                    textColor: Colors.white,
                    height: 40,
                    width: 100,
                    onTap: () {
                      Navigator.of(context).pop(); // Close the dialog
                      onDelete(); // Perform the delete action
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildMenuItem(String title, String path) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: Image.asset(path, color: AppColors.yellow),
          title: commonText(title, size: 14.0, isBold: true),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {},
        ),
        const Divider(),
      ],
    );
  }
}
