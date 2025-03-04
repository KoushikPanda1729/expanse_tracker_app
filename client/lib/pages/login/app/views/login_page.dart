import 'package:expensetracker/pages/login/app/views/login_footer.dart';
import 'package:expensetracker/pages/login/app/views/login_form.dart';
import 'package:expensetracker/pages/login/app/views/login_header.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
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
