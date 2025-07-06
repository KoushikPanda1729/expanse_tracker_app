import 'package:expensetracker/commons/components/button/app/solid_button_widget.dart';
import 'package:expensetracker/commons/constants/app_colors.dart';
import 'package:expensetracker/commons/constants/app_icons.dart';
import 'package:expensetracker/commons/text/app/views/custom_text_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SignupFooter extends StatelessWidget {
  const SignupFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SolidButtonWidget(
          label: "Sign Up",
          onPressed: () {
            context.goNamed("home");
          },
        ),
        const SizedBox(height: 15),
        GestureDetector(
          onTap: () {
            context.goNamed("home");
          },
          child: Container(
            height: 56.0,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.dark100),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Center(
              child: FittedBox(
                child: Row(
                  children: [
                    SvgPicture.asset(AppIcons.flatColorGoogleIcon),
                    const SizedBox(width: 10),
                    Body3(
                      text: "Sign up with Google",
                      color: AppColors.dark100,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Already have an account? "),
            GestureDetector(
              onTap: () {
                context.push("/login");
              },
              child: const Text(
                "Login",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColors.violet100,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
