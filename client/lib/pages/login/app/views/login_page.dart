import 'package:expensetracker/commons/components/button/app/solid_button_widget.dart';
import 'package:expensetracker/commons/constants/app_colors.dart';
import 'package:expensetracker/commons/constants/app_icons.dart';
import 'package:expensetracker/commons/components/notification_bar/notification_bar.dart';
import 'package:expensetracker/commons/text/app/views/custom_text_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 16),
              child: SafeArea(
                child: NotificationBar(
                  isPrifileVisible: false,
                  title: "Sign in",
                  leadingIcon: AppIcons.arrowLeftIcon,
                  isTrailingIcon: false,
                  labelColor: AppColors.dark100,
                  onTap: () {
                    context.goNamed("onboarding");
                  },
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (bool? newValue) {},
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Body3(
                            text: "By signing up, you agree to the",
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Body3(
                              text: "Terms of Service and Privacy Policy",
                              color: AppColors.violet100,
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Column(
              children: [
                SolidButtonWidget(
                    label: "Sign  in",
                    onPressed: () {
                      context.goNamed("home");
                    }),
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
                      borderRadius: BorderRadius.circular(
                        8.0,
                      ),
                    ),
                    child: Center(
                      child: FittedBox(
                        child: Row(
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(AppIcons.flatColorGoogleIcon),
                            const SizedBox(width: 10),
                            Body3(
                                text: "Sign in with google",
                                color: AppColors.dark100)
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
                    const Text("Create an account? "),
                    GestureDetector(
                      onTap: () {
                        context.push("/signup");
                      },
                      child: const Text(
                        "signup",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: AppColors.violet100),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
