import 'package:expensetracker/commons/components/build_spending_categories_card/app/build_spending_categories_card.dart';
import 'package:expensetracker/commons/components/custom_dropDown_widget/app/custom_dropdown_widget.dart';
import 'package:expensetracker/commons/components/notification_bar/notification_bar.dart';
import 'package:expensetracker/commons/components/transaction_card/app/transaction_card.dart';
import 'package:expensetracker/commons/constants/app_colors.dart';
import 'package:expensetracker/commons/constants/app_icons.dart';
import 'package:expensetracker/commons/text/app/views/custom_text_library.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedFilter = 'Today';

  void _updateFilter(String newFilter) {
    setState(() {
      _selectedFilter = newFilter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Sticky Notification Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: NotificationBar(
                  isPrifileVisible: true,
                  isFiltered: false,
                  child: OpenCustomDropdown(
                    currentMonth: "January",
                    title: "Months",
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
                    onItemSelected: (value) {},
                  ),
                  onTap: () {
                    context.goNamed('notifications');
                  }),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildAccountBalance(),
                      const SizedBox(height: 27),
                      Row(
                        children: [
                          Expanded(
                              child: BuildSpendingCategoriesCard(
                            cardTitle: "Income",
                            incomeExpenses: '\$5000',
                            iconColor: AppColors.green100,
                            cardColor: AppColors.green100,
                            icon: AppIcons.incomeIcon,
                            onTap: () {
                              context.push('/income');
                            },
                          )),
                          const SizedBox(width: 16),
                          Expanded(
                            child: BuildSpendingCategoriesCard(
                              cardTitle: "Expenses",
                              incomeExpenses: '\$1200',
                              iconColor: AppColors.red100,
                              cardColor: AppColors.red100,
                              icon: AppIcons.expenseIcon,
                              onTap: () {
                                context.push('/expenses');
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 37),
                      buildSpendFrequencyChart(),
                      const SizedBox(height: 24),
                      buildRecentTransactions(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAccountBalance() {
    return const Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Account Balance',
            style: TextStyle(color: Colors.grey, fontSize: 14, height: 1.6),
          ),
          SizedBox(height: 9),
          Text(
            '\$9,400',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSpendFrequencyChart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Title3(text: "Spend Frequency"),
        const SizedBox(height: 24),
        SizedBox(
          height: 170,
          child: LineChart(
            LineChartData(
              gridData: const FlGridData(show: false),
              titlesData: const FlTitlesData(show: false),
              borderData: FlBorderData(show: false),
              lineBarsData: [
                LineChartBarData(
                  spots: const [
                    FlSpot(1, 4),
                    FlSpot(2.6, 2),
                    FlSpot(4.9, 5),
                    FlSpot(6.8, 3.1),
                    FlSpot(8, 4),
                    FlSpot(9.5, 3),
                    FlSpot(11, 4),
                  ],
                  isCurved: true,
                  color: AppColors.violet100,
                  barWidth: 1,
                  isStrokeCapRound: true,
                  dotData: const FlDotData(show: false),
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
                      colors: [
                        AppColors.violet100.withOpacity(0.0),
                        AppColors.violet100.withOpacity(0.3),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 38),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTimeFilterChip('Today'),
                _buildTimeFilterChip('Week'),
                _buildTimeFilterChip('Month'),
                _buildTimeFilterChip('Year'),
              ],
            ),
            // Container(
            //   decoration: BoxDecoration(
            //     color: AppColors.dark25.withOpacity(0.1),
            //     borderRadius: BorderRadius.circular(30),
            //   ),
            //   child: Stack(
            //     children: [
            //       // Sliding selector
            //       AnimatedAlign(
            //         duration: const Duration(milliseconds: 200),
            //         curve: Curves.easeInOut,
            //         alignment: _selectedFilter == "Expanse"
            //             ? Alignment.centerLeft
            //             : Alignment.centerRight,
            //         child: Container(
            //           width: MediaQuery.of(context).size.width * 0.5 - 18,
            //           height: 52,
            //           decoration: BoxDecoration(
            //             color: AppColors.violet100,
            //             borderRadius: BorderRadius.circular(28),
            //           ),
            //         ),
            //       ),
            //       // Buttons row
            //       Row(
            //         children: [
            //           Expanded(child: _buildToggle('Expanse')),
            //           Expanded(child: _buildToggle('Income')),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ],
    );
  }

  Widget _buildTimeFilterChip(String label) {
    bool isSelected = label == _selectedFilter;
    return GestureDetector(
      onTap: () {
        _updateFilter(label);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.yellow100.withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Body3(
          text: label,
          color: isSelected ? AppColors.yellow100 : AppColors.dark25,
        ),
      ),
    );
  }

  Widget _buildToggle(String label) {
    bool isSelected = label == "Income";

    return GestureDetector(
      onTap: () {
        setState(() {});
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14.5),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? AppColors.light100 : AppColors.dark100,
              fontSize: 16,
              height: 1.8,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRecentTransactions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NotificationBar(
          isPrifileVisible: false,
          isTrailingIcon: false,
          isBottonRequired: true,
          title: "Recent Transaction",
          onTap: () {
            debugPrint('Notification Icon Tapped===>');
          },
        ),
        const SizedBox(height: 16),
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
      ],
    );
  }
}
