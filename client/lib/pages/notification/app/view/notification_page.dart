import 'package:expensetracker/commons/components/notification_bar/notification_bar.dart';
import 'package:expensetracker/commons/constants/app_colors.dart';
import 'package:expensetracker/commons/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: NotificationBar(
              isPrifileVisible: false,
              isTrailingIcon: true,
              trailingIcon: AppIcons.moreHorizontalIcon,
              leadingIcon: AppIcons.arrowLeftIcon,
              title: "Notifications",
              isFiltered: false,
              onTap: () {
                if (GoRouter.of(context).canPop()) {
                  context.pop();
                } else {
                  context.pushReplacement('/');
                }
              },
            ),
          ),
          Row(
            children: [
              Column(
                children: [
                  const Text(
                    "Shopping budget has exceeds the..",
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.9,
                      color: AppColors.dark100,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Shopping budget has exceeds the..",
                    style: TextStyle(
                      fontSize: 13,
                      height: 1.5,
                      color: AppColors.dark100.withOpacity(0.1),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      )),
    );
  }
}
