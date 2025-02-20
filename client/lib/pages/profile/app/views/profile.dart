import 'package:expensetracker/commons/components/menu_item/app/menu_item.dart';
import 'package:expensetracker/commons/constants/app_colors.dart';
import 'package:expensetracker/commons/constants/app_icons.dart';
import 'package:expensetracker/commons/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(32),
                  ),
                ),
                child: ListView(
                  children: [
                    _buildProfileInfo(),
                    const SizedBox(height: 40),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.light20.withOpacity(0.1),
                        border: Border.all(
                            color: AppColors.dark100.withOpacity(0.1),
                            width: 1),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(18),
                        ),
                      ),
                      child: Column(
                        children: [
                          const MenuItem(
                            icon: AppIcons.wallet3Icon,
                            title: 'Account',
                            subtitle: 'Manage your account',
                            iconColor: AppColors.violet100,
                          ),
                          Divider(
                            thickness: 1,
                            color: AppColors.dark100.withOpacity(0.1),
                          ),
                          const MenuItem(
                            icon: AppIcons.settingsIcon,
                            title: 'Settings',
                            subtitle: 'App settings & preferences',
                            iconColor: AppColors.violet100,
                          ),
                          Divider(
                            thickness: 1,
                            color: AppColors.dark100.withOpacity(0.1),
                          ),

                          const MenuItem(
                            icon: AppIcons.uploadIcon,
                            title: 'Export Data',
                            subtitle: 'Export your transaction data',
                            iconColor: AppColors.violet100,
                          ),
                          Divider(
                            thickness: 1,
                            color: AppColors.dark100.withOpacity(0.1),
                          ),
                          const MenuItem(
                            icon: AppIcons.logoutIcon,
                            title: 'Logout',
                            subtitle: 'Sign out of your account',
                            iconColor: AppColors.red100,
                            isLogout: true,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileInfo() {
    return Row(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.violet40,
                AppColors.violet80,
              ],
            ),
          ),
          child: Container(
            width: 32,
            height: 32,
            margin: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(AppImages.profileImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(width: 19),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '@iriana.saliha',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Iriana Saliha',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const Spacer(),
        SvgPicture.asset(AppIcons.editIcon)
      ],
    );
  }
}
