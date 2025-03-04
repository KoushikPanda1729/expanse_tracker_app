import 'package:expensetracker/commons/components/button/app/solid_button_widget.dart';
import 'package:expensetracker/commons/components/text_field/app/views/alphabetic_textfield_widget.dart';
import 'package:expensetracker/commons/components/text_field/app/views/email_textfield_widget.dart';
import 'package:expensetracker/commons/components/text_field/app/views/password_textfield_multi_validation_widget.dart';
import 'package:expensetracker/commons/constants/app_colors.dart';
import 'package:expensetracker/commons/constants/app_icons.dart';
import 'package:expensetracker/commons/components/notification_bar/notification_bar.dart';
import 'package:expensetracker/commons/text/app/views/custom_text_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 16),
                  child: SafeArea(
                    child: NotificationBar(
                      isPrifileVisible: false,
                      title: "Sign Up",
                      leadingIcon: AppIcons.arrowLeftIcon,
                      isTrailingIcon: false,
                      labelColor: AppColors.dark100,
                      onTap: () {
                        context.goNamed("onboarding");
                      },
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AlphabeticTextfieldWidget(
                      labelText: "Username",
                      initialText: '',
                      hintText: 'e.g. John Doe',
                      onTextChanged: (name) {},
                    ),
                    const SizedBox(height: 16),
                    EmailTextfieldWidget(
                        initialText: "",
                        labelText: "email",
                        onTextChanged: (email) {}),
                    const SizedBox(height: 16),
                    PasswordTextFieldMultiValidationWidget(
                      labelText: "Password",
                      onTextChanged: (value) {},
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
                Column(
                  children: [
                    SolidButtonWidget(
                        label: "Sign  Up",
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
                                    text: "Sign up with google",
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
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
