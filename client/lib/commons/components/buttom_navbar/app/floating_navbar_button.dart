import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:expensetracker/commons/constants/app_colors.dart';
import 'package:expensetracker/commons/constants/app_icons.dart';

class FloatingActionButtonWidget extends StatefulWidget {
  final String iconPath;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color iconColor;

  const FloatingActionButtonWidget({
    super.key,
    required this.iconPath,
    required this.onTap,
    this.backgroundColor = AppColors.violet100,
    this.iconColor = Colors.white,
  });

  @override
  State<FloatingActionButtonWidget> createState() =>
      _FloatingActionButtonWidgetState();
}

class _FloatingActionButtonWidgetState
    extends State<FloatingActionButtonWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Income Button
        if (_isExpanded)
          Positioned(
            bottom: 90,
            right: 140,
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context).goNamed('income');
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.green100,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    AppIcons.incomeIcon,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                    height: 32,
                    width: 32,
                  ),
                ),
              ),
            ),
          ),

        // Expense Button
        if (_isExpanded)
          Positioned(
            bottom: 90,
            left: 140,
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context).goNamed('expenses');
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.red100,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    AppIcons.expenseIcon,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                    height: 32,
                    width: 32,
                  ),
                ),
              ),
            ),
          ),

        // Transfer Button
        if (_isExpanded)
          Positioned(
            bottom: 150,
            right: 185,
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context).goNamed('transfer'); // Correct route
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.blue100,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    AppIcons.currencyExchangeIcon,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                    height: 32,
                    width: 32,
                  ),
                ),
              ),
            ),
          ),

        // Main Floating Button (Centered)
        Align(
          alignment: Alignment.bottomCenter,
          child: GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
              widget.onTap();
            },
            child: Container(
              height: 120,
              width: 56,
              decoration: BoxDecoration(
                color: widget.backgroundColor,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                widget.iconPath,
                colorFilter: ColorFilter.mode(
                  widget.iconColor,
                  BlendMode.srcIn,
                ),
                height: 32,
                width: 32,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
