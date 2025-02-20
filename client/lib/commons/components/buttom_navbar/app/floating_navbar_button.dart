
import 'package:expensetracker/commons/constants/app_colors.dart';
import 'package:expensetracker/commons/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        // Blue Button (Income)
        AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          bottom: _isExpanded ? 100 : 0,
          left: 0,
          right: 0,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: _isExpanded ? 1 : 0,
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

        // Red Button (Upload)
        AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          bottom: _isExpanded ? 60 : 0,
          left: _isExpanded ? -60 : 0,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: _isExpanded ? 1 : 0,
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

        // Green Button (Download)
        AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          bottom: _isExpanded ? 60 : 0,
          right: _isExpanded ? -60 : 0,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: _isExpanded ? 1 : 0,
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

        // Main Button
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
            widget.onTap();
          },
          child: Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              color: widget.backgroundColor,
              shape: BoxShape.circle,
            ),
            child: AnimatedRotation(
              duration: const Duration(milliseconds: 300),
              turns: _isExpanded ? 0.125 : 0,
              child: SvgPicture.asset(
                widget.iconPath,
                color: widget.iconColor,
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
