import 'package:expensetracker/commons/components/notification_bar/notification_bar.dart';
import 'package:expensetracker/commons/constants/app_colors.dart';
import 'package:expensetracker/commons/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignupHeader extends StatelessWidget {
  const SignupHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NotificationBar(
        isPrifileVisible: false,
        title: "Sign Up",
        leadingIcon: AppIcons.arrowLeftIcon,
        isTrailingIcon: false,
        labelColor: AppColors.dark100,
        onTap: () {
          context.goNamed("onboarding");
        },
      ),
    );
  }
}
