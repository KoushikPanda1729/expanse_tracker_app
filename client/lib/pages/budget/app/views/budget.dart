import 'package:expensetracker/commons/components/budget_card/app/budget_card.dart';
import 'package:expensetracker/commons/components/button/app/solid_button_widget.dart';
import 'package:expensetracker/commons/components/notification_bar/notification_bar.dart';
import 'package:expensetracker/commons/constants/app_colors.dart';
import 'package:expensetracker/commons/constants/app_icons.dart';
import 'package:flutter/material.dart';

class BudgetScreen extends StatelessWidget {
  const BudgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.violet100,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: SafeArea(
              child: NotificationBar(
                labelColor: AppColors.light100,
                isTrailingIcon: true,
                trailingIcon: AppIcons.arrowRight2Icon,
                leadingIcon: AppIcons.arrowLeft2Icon,
                isFiltered: false,
                title: "May",
                onTap: () {
                  debugPrint('Notification Icon Tapped===>');
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              decoration: const BoxDecoration(
                color: AppColors.light100,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: const [
                        SizedBox(height: 16),
                        BudgetCard(
                          title: 'Shopping',
                          color: AppColors.yellow100,
                          spent: 1200,
                          total: 1000,
                        ),
                        SizedBox(height: 16),
                        BudgetCard(
                          title: 'Transportation',
                          color: AppColors.blue100,
                          spent: 400,
                          total: 400,
                        ),
                        SizedBox(height: 16),
                        BudgetCard(
                          title: 'Medical',
                          color: AppColors.green100,
                          spent: 500,
                          total: 800,
                        ),
                        SizedBox(height: 16),
                        BudgetCard(
                          title: 'Shopping',
                          color: AppColors.yellow100,
                          spent: 1200,
                          total: 1000,
                        ),
                        SizedBox(height: 16),
                        BudgetCard(
                          title: 'Transportation',
                          color: AppColors.blue100,
                          spent: 400,
                          total: 400,
                        ),
                        SizedBox(height: 16),
                        BudgetCard(
                          title: 'Medical',
                          color: AppColors.green100,
                          spent: 500,
                          total: 800,
                        ),
                        SizedBox(height: 16),
                        BudgetCard(
                          title: 'Shopping',
                          color: AppColors.yellow100,
                          spent: 1200,
                          total: 1000,
                        ),
                        SizedBox(height: 16),
                        BudgetCard(
                          title: 'Transportation',
                          color: AppColors.blue100,
                          spent: 400,
                          total: 400,
                        ),
                        SizedBox(height: 16),
                        BudgetCard(
                          title: 'Medical',
                          color: AppColors.green100,
                          spent: 500,
                          total: 800,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: SolidButtonWidget(
                      label: "Create a budget",
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
