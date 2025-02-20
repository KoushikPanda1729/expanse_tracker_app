import 'package:expensetracker/commons/components/button/app/solid_button_widget.dart';
import 'package:expensetracker/commons/constants/app_colors.dart';
import 'package:expensetracker/commons/text/app/views/custom_text_library.dart';
import 'package:flutter/material.dart';

class QuotePage extends StatelessWidget {
  const QuotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.violet100, 
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Title1(
                      text: "“Financial freedom is\nfreedom from fear.”",
                      color: AppColors.light100,
                    ),
                    const SizedBox(height: 14),
                    Title2(
                      text: "- Robert Kiyosaki",
                      color: AppColors.light100,
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
              child: SolidButtonWidget(
                  label: "See the full detail",
                  onPressed: () {},
                  backgroundColor: AppColors.light100,
                  labelColor: AppColors.violet100),
            ),
          ],
        ),
      ),
    );
  }
}
