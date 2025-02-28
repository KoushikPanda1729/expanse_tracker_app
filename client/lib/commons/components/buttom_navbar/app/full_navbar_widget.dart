import 'package:expensetracker/commons/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:expensetracker/commons/constants/app_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBarWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavBarWidget({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70, // height of the custom bottom nav bar
      decoration: BoxDecoration(
        color: Colors.white, // background color of the bottom nav bar
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            spreadRadius: 0,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          NavItem(
            iconPath: AppIcons.homeIcon,
            label: 'Home',
            isSelected: selectedIndex == 0,
            onTap: () => onItemTapped(0),
          ),
          NavItem(
            iconPath: AppIcons.transactionIcon,
            label: 'Transaction',
            isSelected: selectedIndex == 1,
            onTap: () => onItemTapped(1),
          ),
          const SizedBox(width: 56), // Placeholder for notch area
          NavItem(
            iconPath: AppIcons.pieChartIcon,
            label: 'Budget',
            isSelected: selectedIndex == 2,
            onTap: () => onItemTapped(2),
          ),
          NavItem(
            iconPath: AppIcons.userIcon,
            label: 'Profile',
            isSelected: selectedIndex == 3,
            onTap: () => onItemTapped(3),
          ),
        ],
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final String iconPath;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const NavItem({
    super.key,
    required this.iconPath,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            iconPath,
            color: isSelected ? AppColors.violet100 : Colors.grey,
            height: 24,
            width: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? AppColors.violet100 : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
