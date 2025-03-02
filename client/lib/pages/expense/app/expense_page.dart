import 'package:expensetracker/commons/components/add_attach_widget/app/add_attach_widget.dart';
import 'package:expensetracker/commons/components/button/app/solid_button_widget.dart';
import 'package:expensetracker/commons/components/repeate_transaction_widget/app/repeate_transaction_widget.dart';
import 'package:expensetracker/commons/components/text_field/app/views/alphabetic_textfield_widget.dart';
import 'package:expensetracker/commons/components/text_field/app/views/textfield_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:expensetracker/commons/components/notification_bar/notification_bar.dart';
import 'package:expensetracker/commons/constants/app_colors.dart';
import 'package:expensetracker/commons/constants/app_icons.dart';
import 'package:go_router/go_router.dart';

class ExpensePage extends StatelessWidget {
  const ExpensePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.red100,
      body: Column(
        children: [
          // Top section with notification bar
          SafeArea(
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: NotificationBar(
                isPrifileVisible: false,
                title: "Expense",
                leadingIcon: AppIcons.arrowLeftIcon,
                isTrailingIcon: false,
                labelColor: Colors.white,
                onTap: () {
                  if (GoRouter.of(context).canPop()) {
                    context.pop();
                  } else {
                    context.pushReplacement('/');
                  }
                },
              ),
            ),
          ),
          // Expanded red section with centered amount
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'How much?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '\$0',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 64,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Bottom white section
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: Column(
              children: [
                TextfieldDropdown<String>(
                  title: "Select Category",
                  label: '',
                  hintText: 'Category',
                  selectedItem: 'Subscription',
                  items: const ['shopping', 'Subscription', 'Transport'],
                  onItemSelected: (category) {},
                  getDisplayText: (category) => category,
                ),
                const SizedBox(height: 16),
                AlphabeticTextfieldWidget(
                  onTextChanged: (value) {},
                  labelText: "Description",
                  hintText: "e.g. get from salary",
                ),
                const SizedBox(height: 16),
                TextfieldDropdown<String>(
                  title: "Account Type",
                  label: '',
                  hintText: 'Wallet',
                  selectedItem: 'Wallet',
                  items: const [
                    'Wallet',
                    'Account',
                  ],
                  onItemSelected: (accountType) {},
                  getDisplayText: (accountType) => accountType,
                ),
                const SizedBox(height: 16),
                const AddAttachWidget(),
                const SizedBox(height: 16),
                const RepeateTransactionWidget(),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: SolidButtonWidget(label: "Continue", onPressed: () {}),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
