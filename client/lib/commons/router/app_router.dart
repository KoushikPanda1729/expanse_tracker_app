import 'package:expensetracker/pages/expense/app/expense_page.dart';
import 'package:expensetracker/pages/income/app/income_page.dart';
import 'package:expensetracker/pages/onboarding_page/login_page.dart';
import 'package:expensetracker/pages/onboarding_page/onboarding_page.dart';
import 'package:expensetracker/pages/onboarding_page/signup_page.dart';
import 'package:expensetracker/pages/transfer/app/transfer_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:expensetracker/pages/notification/app/view/notification_page.dart';
import 'package:expensetracker/main.dart';

final goRouter = GoRouter(
  initialLocation: '/onboarding',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return const MyApp();
      },
      routes: [
        GoRoute(
          path: '/',
          name: "home",
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
    GoRoute(
      name: 'onboarding',
      path: '/onboarding',
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      name: 'signup',
      path: '/signup',
      builder: (context, state) => const SignupPage(),
    ),
    GoRoute(
      name: 'transfer',
      path: '/transfer',
      builder: (context, state) => const TransferPage(),
    ),
    GoRoute(
      name: 'login',
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
  ],
);
