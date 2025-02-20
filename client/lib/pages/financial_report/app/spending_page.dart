import 'dart:math';

import 'package:expensetracker/commons/components/report_card/app/report_card.dart';
import 'package:expensetracker/commons/constants/app_colors.dart';
import 'package:expensetracker/commons/text/app/views/custom_text_library.dart';
import 'package:expensetracker/pages/financial_report/app/budget_page.dart';
import 'package:flutter/material.dart';

class SpendingEarningPage extends StatelessWidget {
  final String title;
  final String totalSpendAndEarned;
  final Color backgroundColor;
  final String cardTitle;
  final List<String> icons;
  final List<String> categories;
  final String maxEarnAndSpend;
  final bool isBudget;

  const SpendingEarningPage({
    super.key,
    required this.backgroundColor,
    required this.title,
    required this.totalSpendAndEarned,
    required this.cardTitle,
    required this.categories,
    required this.icons,
    required this.maxEarnAndSpend,
    this.isBudget = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: isBudget
                ? MainAxisAlignment.center
                : MainAxisAlignment.spaceAround,
            children: [
              Title2(
                text: "This Month",
                color: AppColors.light100,
              ),
              Column(
                children: [
                  Title1(
                    text: title,
                    color: AppColors.light100,
                  ),
                  const SizedBox(height: 24),
                  if (!isBudget)
                    TitleX(
                      text: totalSpendAndEarned,
                      color: AppColors.light100,
                    ),
                  if (isBudget)
                    Wrap(
                      spacing: 16, // Horizontal spacing between items
                      runSpacing: 16, // Vertical spacing between rows
                      alignment: WrapAlignment.center,
                      children: List.generate(categories.length, (index) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width *
                              0.4, // Ensure two items per row
                          child: BudgetbuttonCard(
                            icon: icons[index],
                            category: categories[index],
                            iconColor: Colors.primaries[
                                Random().nextInt(Colors.primaries.length)],
                          ),
                        );
                      }),
                    ),
                ],
              ),
              if (!isBudget) ...[
                const SizedBox(height: 30),
                ReportCard(
                  title: cardTitle,
                  icon: icons.isNotEmpty ? icons.first : "",
                  iconColor: backgroundColor,
                  category: categories.isNotEmpty ? categories.first : "",
                  totalCost: maxEarnAndSpend,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
