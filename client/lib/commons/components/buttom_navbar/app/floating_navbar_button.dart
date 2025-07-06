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
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    // Calculate dynamic positioning
    const double buttonSize = 55;
    final double spacing = screenHeight * 0.1;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Income Button
        if (_isExpanded)
          Positioned(
            bottom: spacing,
            left: screenWidth * 0.31,
            child: _buildActionButton(
              iconPath: AppIcons.incomeIcon,
              color: AppColors.green100,
              onTap: () => context.push("/income"),
              size: buttonSize,
            ),
          ),

        // Expense Button
        if (_isExpanded)
          Positioned(
            bottom: spacing,
            right: screenWidth * 0.31,
            child: _buildActionButton(
              iconPath: AppIcons.expenseIcon,
              color: AppColors.red100,
              onTap: () => context.push("/expenses"),
              size: buttonSize,
            ),
          ),

        // Transfer Button
        if (_isExpanded)
          Positioned(
            bottom: spacing * 1.6,
            left: (screenWidth / 2) - (buttonSize / 2),
            child: _buildActionButton(
              iconPath: AppIcons.currencyExchangeIcon,
              color: AppColors.blue100,
              onTap: () => context.push("/transfer"),
              size: buttonSize,
            ),
          ),

        // Main Floating Button (Centered)
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
                widget.onTap();
              },
              child: AnimatedRotation(
                duration: const Duration(milliseconds: 200),
                turns: _isExpanded ? 0.125 : 0.0,
                child: Container(
                  height: buttonSize,
                  width: buttonSize,
                  decoration: BoxDecoration(
                    color: widget.backgroundColor,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(buttonSize * 0.1),
                    child: SvgPicture.asset(
                      widget.iconPath,
                      colorFilter: ColorFilter.mode(
                        widget.iconColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Reusable action button builder
  Widget _buildActionButton({
    required String iconPath,
    required Color color,
    required VoidCallback onTap,
    required double size,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: EdgeInsets.all(size * 0.2),
          child: SvgPicture.asset(
            iconPath,
            colorFilter: const ColorFilter.mode(
              Colors.white,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
