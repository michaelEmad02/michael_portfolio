import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/localization/l10n.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? badgeText;
  final bool isCentered;

  const SectionHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.badgeText,
    this.isCentered = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isArabic = context.isArabic;

    final crossAxisAlignment = isCentered
        ? CrossAxisAlignment.center
        : CrossAxisAlignment.start;

    final textAlign = isCentered ? TextAlign.center : TextAlign.start;

    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        if (badgeText != null) ...[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: isDark
                  ? AppColors.darkPrimary.withOpacity(0.1)
                  : AppColors.lightPrimary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: isDark
                    ? AppColors.darkPrimary.withOpacity(0.3)
                    : AppColors.lightPrimary.withOpacity(0.3),
              ),
            ),
            child: Text(
              badgeText!,
              style: isArabic
                  ? AppTypography.bodyMedium(
                      color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
                      isArabic: true,
                    ).copyWith(fontWeight: FontWeight.bold)
                  : AppTypography.code(
                      color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
                      fontSize: 12,
                    ).copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 12),
        ],
        Text(
          title,
          textAlign: textAlign,
          style: AppTypography.headingMedium(
            color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
            isArabic: isArabic,
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 8),
          Text(
            subtitle!,
            textAlign: textAlign,
            style: AppTypography.bodyLarge(
              color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
              isArabic: isArabic,
            ),
          ),
        ],
      ],
    );
  }
}
