import 'package:flutter/material.dart';
import 'package:expensetracker/pages/sign_up/app/views/signup_footer.dart';
import 'package:expensetracker/pages/sign_up/app/views/signup_form.dart';
import 'package:expensetracker/pages/sign_up/app/views/signup_header.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Sticky Header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: SignupHeader(),
            ),

            // Scrollable Content
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      SizedBox(height: 16),
                      SignupForm(),
                    ],
                  ),
                ),
              ),
            ),

            // Sticky Footer
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 46),
              child: SignupFooter(),
            ),
          ],
        ),
      ),
    );
  }
}
