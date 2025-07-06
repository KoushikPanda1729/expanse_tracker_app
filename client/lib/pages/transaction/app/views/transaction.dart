import 'package:expensetracker/commons/components/custom_bottom_sheet/app/open_custom_bottom_sheet.dart';
import 'package:expensetracker/commons/components/filter_bottomsheet/app/filter_bottomsheet.dart';
import 'package:expensetracker/commons/components/notification_bar/notification_bar.dart';
import 'package:expensetracker/commons/components/text_field/app/views/textfield_dropdown.dart';
import 'package:expensetracker/commons/components/transaction_card/app/transaction_card.dart';
import 'package:expensetracker/commons/constants/app_colors.dart';
import 'package:expensetracker/commons/constants/app_icons.dart';
import 'package:expensetracker/commons/text/app/views/custom_text_library.dart';
import 'package:expensetracker/pages/financial_report/app/financial_report.dart';
import 'package:flutter/material.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NotificationBar(
                trailingIcon: AppIcons.sortIcon,
                child: SizedBox(
                  width: 107,
                  child: TextfieldDropdown<String>(
                    isCircularBorder: true,
                    title: "Select months",
                    label: '',
                    hintText: '',
                    selectedItem: 'January',
                    items: const [
                      'January',
                      'February',
                      'March',
                      'April',
                      'May',
                      'June',
                      'July',
                      'August',
                      'September',
                      'October',
                      'November',
                      'December',
                    ],
                    onItemSelected: (category) {},
                    getDisplayText: (category) => category,
                  ),
                ),
                onTap: () {
                  openCustomBottomSheet(
                    context: context,
                    child: FilterBottomSheet(),
                  );
                },
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FinancialReport()),
                  );
                },
                child: NotificationBar(
                  isTrailingIcon: true,
                  trailingIcon: AppIcons.arrowRight2Icon,
                  backgroundColor: AppColors.green100.withOpacity(0.1),
                  isFiltered: false,
                  title: "See your financial report",
                  onTap: () {},
                ),
              ),
              const SizedBox(height: 24),
              _buildTransactionsList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTransactionsList() {
    return Expanded(
      child: ListView(
        children: [
          _buildDateSection('Today', [
            TransactionCard(
              icon: AppIcons.shoppingBagIcon,
              iconColor: AppColors.yellow100,
              isIncome: false,
              title: 'Shopping',
              description:
                  'lorem ipsum dolor sit amet consectetur lorem ipsum dolor sit amet consectetur',
              time: '02:30 PM',
              amount: '- Rp 229.000',
              onTap: () {},
            ),
            const SizedBox(height: 8),
            TransactionCard(
              icon: AppIcons.recurringBillIcon,
              iconColor: AppColors.violet100,
              isIncome: true,
              title: 'Shopping',
              description:
                  'lorem ipsum dolor sit amet consectetur lorem ipsum dolor sit amet consectetur',
              time: '02:30 PM',
              amount: '- Rp 229.000',
              onTap: () {},
            ),
            const SizedBox(height: 8),
            TransactionCard(
              icon: AppIcons.restaurantIcon,
              iconColor: AppColors.red100,
              isIncome: false,
              title: 'Shopping',
              description:
                  'lorem ipsum dolor sit amet consectetur lorem ipsum dolor sit amet consectetur',
              time: '02:30 PM',
              amount: '- Rp 229.000',
              onTap: () {},
            )
          ]),
          _buildDateSection('Yesterday', [
            TransactionCard(
              icon: AppIcons.shoppingBagIcon,
              iconColor: AppColors.yellow100,
              isIncome: false,
              title: 'Shopping',
              description:
                  'lorem ipsum dolor sit amet consectetur lorem ipsum dolor sit amet consectetur',
              time: '02:30 PM',
              amount: '- Rp 229.000',
              onTap: () {},
            ),
            const SizedBox(height: 8),
            TransactionCard(
              icon: AppIcons.wallet3Icon,
              iconColor: AppColors.green100,
              isIncome: true,
              title: 'Shopping',
              description:
                  'lorem ipsum dolor sit amet consectetur lorem ipsum dolor sit amet consectetur',
              time: '02:30 PM',
              amount: '- Rp 229.000',
              onTap: () {},
            ),
            const SizedBox(height: 8),
            TransactionCard(
              icon: AppIcons.restaurantIcon,
              iconColor: AppColors.red100,
              isIncome: false,
              title: 'Shopping',
              description:
                  'lorem ipsum dolor sit amet consectetur lorem ipsum dolor sit amet consectetur',
              time: '02:30 PM',
              amount: '- Rp 229.000',
              onTap: () {},
            )
          ]),
          _buildDateSection('Older', [
            TransactionCard(
              icon: AppIcons.carIcon,
              iconColor: AppColors.blue100,
              isIncome: false,
              title: 'Shopping',
              description:
                  'lorem ipsum dolor sit amet consectetur lorem ipsum dolor sit amet consectetur',
              time: '02:30 PM',
              amount: '- Rp 229.000',
              onTap: () {},
            ),
            const SizedBox(height: 8),
            TransactionCard(
              icon: AppIcons.wallet3Icon,
              iconColor: AppColors.green100,
              isIncome: true,
              title: 'Shopping',
              description:
                  'lorem ipsum dolor sit amet consectetur lorem ipsum dolor sit amet consectetur',
              time: '02:30 PM',
              amount: '- Rp 229.000',
              onTap: () {},
            ),
            const SizedBox(height: 8),
            TransactionCard(
              icon: AppIcons.restaurantIcon,
              iconColor: AppColors.red100,
              isIncome: false,
              title: 'Shopping',
              description:
                  'lorem ipsum dolor sit amet consectetur lorem ipsum dolor sit amet consectetur',
              time: '02:30 PM',
              amount: '- Rp 229.000',
              onTap: () {},
            )
          ]),
        ],
      ),
    );
  }

  Widget _buildDateSection(String date, List<Widget> transactions) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Title3(text: date),
        ),
        ...transactions,
      ],
    );
  }
}
