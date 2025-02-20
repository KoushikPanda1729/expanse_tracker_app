import 'package:expensetracker/pages/budget/app/views/budget.dart';
import 'package:expensetracker/commons/components/buttom_navbar/app/floating_navbar_button.dart';
import 'package:expensetracker/commons/components/buttom_navbar/app/full_navbar_widget.dart';
import 'package:expensetracker/commons/constants/app_colors.dart';
import 'package:expensetracker/commons/constants/app_icons.dart';
import 'package:expensetracker/pages/home/app/views/home.dart';
import 'package:expensetracker/pages/profile/app/views/profile.dart';
import 'package:expensetracker/pages/transaction/app/views/transaction.dart';
import 'package:flutter/material.dart';
import 'package:expensetracker/commons/router/app_router.dart';

void main() {
  runApp(const MyAppRouter());
}

class MyAppRouter extends StatelessWidget {
  const MyAppRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  final List<Widget> _screens = [
    const HomeScreen(),
    const TransactionScreen(),
    const BudgetScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButtonWidget(
        iconPath: AppIcons.plusIcon,
        onTap: () {},
        backgroundColor: AppColors.violet100,
        iconColor: Colors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBarWidget(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
