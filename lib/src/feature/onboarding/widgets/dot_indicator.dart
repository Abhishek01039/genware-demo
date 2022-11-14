import 'package:flutter/material.dart';

import 'package:genware/src/theme/app_color_theme.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    required this.pageLength,
    required this.activeIndex,
    this.activeColor,
    this.borderColor,
    this.radius,
  }) : super(key: key);

  final int pageLength;
  final int activeIndex;
  final double? radius;
  final Color? activeColor, borderColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        pageLength,
        (index) => AnimatedContainer(
          margin: const EdgeInsets.all((4)),
          duration: const Duration(milliseconds: 350),
          height: (radius ?? 16),
          width: (radius ?? 16),
          decoration: BoxDecoration(
            color: activeIndex == index
                ? AppColorTheme.transparent
                : AppColorTheme.gray,
            borderRadius: BorderRadius.circular(2),
            border: Border.all(
              width: 2,
              color: activeIndex == index
                  ? AppColorTheme.green
                  : borderColor ?? AppColorTheme.gray,
            ),
          ),
        ),
      ),
    );
  }
}
