import 'package:expensetracker/pages/expense/app/expense_page.dart';
import 'package:expensetracker/pages/income/app/income_page.dart';
import 'package:expensetracker/pages/login/app/views/login_page.dart';
import 'package:expensetracker/pages/main_screen/main_screen.dart';
import 'package:expensetracker/pages/onboarding_page/app/views/onboarding_page.dart';
import 'package:expensetracker/pages/sign_up/app/views/signup_page.dart';
import 'package:expensetracker/pages/onboarding_page/app/views/splash_page.dart';
import 'package:expensetracker/pages/transfer/app/transfer_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:expensetracker/pages/notification/app/view/notification_page.dart';

final goRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return const MainScreen();
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
      name: 'splash',
      path: '/splash',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      name: 'onboarding',
      path: '/onboarding',
      builder: (context, state) => const OnboardingPage(),
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
