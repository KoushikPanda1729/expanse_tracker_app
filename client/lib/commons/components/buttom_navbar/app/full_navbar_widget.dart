import 'package:expensetracker/commons/components/buttom_navbar/app/buttom_navbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:expensetracker/commons/constants/app_icons.dart';

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
    return BottomAppBar(
      notchMargin: 8,
      shape: const CircularNotchedRectangle(),
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
          const SizedBox(width: 56),
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
