import 'package:expensetracker/commons/components/text_field/app/views/alphabetic_textfield_widget.dart';
import 'package:expensetracker/commons/components/text_field/app/views/email_textfield_widget.dart';
import 'package:expensetracker/commons/components/text_field/app/views/password_textfield_multi_validation_widget.dart';
import 'package:expensetracker/commons/constants/app_colors.dart';
import 'package:expensetracker/commons/text/app/views/custom_text_library.dart';
import 'package:flutter/material.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
          labelText: "Email",
          onTextChanged: (email) {},
        ),
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
