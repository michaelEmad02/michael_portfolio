import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radius.dart';
import '../../core/theme/app_typography.dart';

class TechBadge extends StatelessWidget {
  final String label;
  final IconData? icon;
  final bool isPrimary;

  const TechBadge({
    super.key,
    required this.label,
    this.icon,
    this.isPrimary = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final bgColor = isPrimary
        ? (isDark
            ? AppColors.darkPrimary.withOpacity(0.15)
            : AppColors.lightPrimary.withOpacity(0.12))
        : (isDark
            ? AppColors.darkSurfaceContainerHighest.withOpacity(0.5)
            : AppColors.lightSurfaceContainerHigh);

    final borderColor = isPrimary
        ? (isDark
            ? AppColors.darkPrimary.withOpacity(0.4)
            : AppColors.lightPrimary.withOpacity(0.3))
        : (isDark
            ? AppColors.darkOutline.withOpacity(0.6)
            : AppColors.lightOutline);

    final textColor = isPrimary
        ? (isDark ? AppColors.darkPrimary : AppColors.lightPrimary)
        : (isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(AppRadius.xs),
        border: Border.all(color: borderColor, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 12, color: textColor),
            const SizedBox(width: 5),
          ],
          Text(
            label,
            style: AppTypography.tag(color: textColor),
          ),
        ],
      ),
    );
  }
}
