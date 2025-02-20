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
          builder: (context, state) =>
              const SizedBox(),
        ),
      ],
    ),
    GoRoute(
      name: 'notifications',
      path: '/notifications',
      builder: (context, state) => const NotificationPage(),
    ),
  ],
);
