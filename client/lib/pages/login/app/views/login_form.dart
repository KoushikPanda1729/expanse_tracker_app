import 'package:expensetracker/commons/components/text_field/app/views/email_textfield_widget.dart';
import 'package:expensetracker/commons/components/text_field/app/views/password_textfield_widget.dart';
import 'package:expensetracker/commons/constants/app_colors.dart';
import 'package:expensetracker/commons/text/app/views/custom_text_library.dart';
import 'package:expensetracker/pages/login/app/providers/login_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginForm extends ConsumerWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(loginProvider.notifier);
    final state = ref.watch(loginProvider);
    return Column(
      children: [
        EmailTextfieldWidget(
          initialText: "",
          labelText: "Email",
          onTextChanged: (email) {
            viewModel.updateEmail(email);
          },
        ),
        const SizedBox(height: 16),
        PasswordTextFieldWidget(
          onTextChanged: (password) {
            viewModel.updatePassword(password);
          },
          labelText: "Password",
        ),
      ],
    );
  }
}
