import 'package:expensetracker/pages/login/app/providers/login_page_provider.dart';
import 'package:expensetracker/pages/login/app/views/login_footer.dart';
import 'package:expensetracker/pages/login/app/views/login_form.dart';
import 'package:expensetracker/pages/login/app/views/login_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(loginProvider.notifier);
    final state = ref.watch(loginProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (state.errorMessage.isNotEmpty && state.errorMessage != '') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.errorMessage),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 2),
          ),
        );
      }
    });

    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Sticky Header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: LoginHeader(),
            ),

            // Scrollable Content
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      SizedBox(height: 16),
                      LoginForm(),
                    ],
                  ),
                ),
              ),
            ),

            // Sticky Footer
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 46),
              child: LoginFooter(),
            ),
          ],
        ),
      ),
    );
  }
}
