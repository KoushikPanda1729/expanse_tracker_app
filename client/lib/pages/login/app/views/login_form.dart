import 'package:expensetracker/commons/components/text_field/app/views/email_textfield_widget.dart';
import 'package:expensetracker/commons/components/text_field/app/views/password_textfield_widget.dart';
import 'package:expensetracker/commons/constants/app_colors.dart';
import 'package:expensetracker/commons/text/app/views/custom_text_library.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EmailTextfieldWidget(
          initialText: "",
          labelText: "Email",
          onTextChanged: (email) {},
        ),
        const SizedBox(height: 16),
        PasswordTextFieldWidget(
          onTextChanged: (value) {},
          labelText: "Password",
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
                Body3(text: "By signing up, you agree to the"),
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
        ),
      ],
    );
  }
}
