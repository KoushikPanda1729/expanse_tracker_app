import 'package:expensetracker/pages/expense/app/expense_page.dart';
import 'package:expensetracker/pages/income/app/income_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:expensetracker/pages/notification/app/view/notification_page.dart';
import 'package:expensetracker/main.dart';

final goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return const MyApp();
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const SizedBox(),
        ),
      ],
    ),
    GoRoute(
      name: 'notifications',
      path: '/notifications',
      builder: (context, state) => const NotificationPage(),
    ),
    GoRoute(
      name: 'expenses',
      path: '/expenses',
      builder: (context, state) => const ExpensePage(),
    ),
    GoRoute(
      name: 'income',
      path: '/income',
      builder: (context, state) => const IncomePage(),
    ),
  ],
);
