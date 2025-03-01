import 'package:expensetracker/commons/constants/app_colors.dart';
import 'package:expensetracker/commons/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:expensetracker/pages/financial_report/app/spending_page.dart';
import 'package:expensetracker/pages/financial_report/app/quote_page.dart';

class FinancialReport extends StatefulWidget {
  @override
  _FinancialReportState createState() => _FinancialReportState();
}

class _FinancialReportState extends State<FinancialReport> {
  late PageController _pageController;
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const SpendingEarningPage(
      backgroundColor: AppColors.red100,
      totalSpendAndEarned: "5000",
      title: "You Spend",
      cardTitle: "Your biggest Spending is Form",
      icons: [AppIcons.shoppingBagIcon],
      categories: ["Shopping"],
      maxEarnAndSpend: "4000",
    ),
    const SpendingEarningPage(
      backgroundColor: AppColors.green100,
      totalSpendAndEarned: "6000",
      title: "You Earned",
      cardTitle: "Your biggest Income is Form",
      icons: [AppIcons.salaryIcon],
      categories: ["Salary"],
      maxEarnAndSpend: "5000",
    ),
    const SpendingEarningPage(
      backgroundColor: AppColors.violet100,
      totalSpendAndEarned: "6000",
      title: "2 of 12 Budget is exceeds",
      cardTitle: "Your biggest Income is Form",
      icons: [
        AppIcons.salaryIcon,
        AppIcons.restaurantIcon,
        AppIcons.salaryIcon,
        AppIcons.restaurantIcon,
        AppIcons.salaryIcon,
        AppIcons.restaurantIcon
      ],
      categories: [
        "Shopping",
        "Food",
        "Shopping",
        "Food",
        "Shopping",
        "Food",
      ],
      maxEarnAndSpend: "5000",
      isBudget: true,
    ),
    const QuotePage(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToNextPage() {
    if (_currentIndex < _pages.length - 1) {
      setState(() {
        _currentIndex++;
      });
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToPreviousPage() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTapUp: (details) {
          double screenWidth = MediaQuery.of(context).size.width;
          if (details.globalPosition.dx < screenWidth / 2) {
            _goToPreviousPage();
          } else {
            _goToNextPage();
          }
        },
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              children: _pages,
            ),
            Positioned(
              top: 60,
              left: 10,
              right: 10,
              child: Row(
                children: List.generate(_pages.length, (index) {
                  return Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width /
                          (_pages.length * 1.5),
                      height: 3,
                      decoration: BoxDecoration(
                        color: index == _currentIndex
                            ? Colors.white
                            : Colors.white.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
