import 'package:flutter/material.dart';
import '../../../../core/localization/l10n.dart';
import '../../../../core/responsive/responsive_layout.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../shared/widgets/glass_card.dart';
import '../../../../shared/widgets/section_header.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isMobile = ResponsiveLayout.isMobile(context);
    final isArabic = context.isArabic;
    final l10n = context.l10n;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 30 : 50,
        horizontal: 20,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1240),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionHeader(
                title: l10n.educationSubtitle,
                subtitle: l10n.educationTitle,
                // badgeText: '// ACADEMICS',
              ),

              const SizedBox(height: 24),

              GlassCard(
                padding: EdgeInsets.all(isMobile ? 20 : 28),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.darkPrimary.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(AppRadius.xs),
                        border: Border.all(
                          color: AppColors.darkPrimary.withOpacity(0.4),
                        ),
                      ),
                      child: const Icon(
                        Icons.school_rounded,
                        color: AppColors.darkPrimary,
                        size: 26,
                      ),
                    ),
                    const SizedBox(width: 18),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (isMobile) ...[
                            Text(
                              l10n.educationUni,
                              style: AppTypography.headingSmall(
                                color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                                isArabic: isArabic,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: isDark ? AppColors.darkSurfaceContainerHighest : AppColors.lightSurfaceContainerHigh,
                                borderRadius: BorderRadius.circular(AppRadius.xs),
                              ),
                              child: Text(
                                l10n.educationPeriod,
                                style: AppTypography.code(
                                  color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ] else ...[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    l10n.educationUni,
                                    style: AppTypography.headingSmall(
                                      color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                                      isArabic: isArabic,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: isDark ? AppColors.darkSurfaceContainerHighest : AppColors.lightSurfaceContainerHigh,
                                    borderRadius: BorderRadius.circular(AppRadius.xs),
                                  ),
                                  child: Text(
                                    l10n.educationPeriod,
                                    style: AppTypography.code(
                                      color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                          const SizedBox(height: 6),
                          Text(
                            '${l10n.educationFaculty} — ${l10n.educationDept}',
                            style: isArabic
                                ? AppTypography.bodyLarge(
                                    color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                                    isArabic: true,
                                  ).copyWith(fontWeight: FontWeight.w600)
                                : AppTypography.code(
                                    color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                                    fontSize: 14,
                                  ).copyWith(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.accentGreen.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: AppColors.accentGreen.withOpacity(0.4)),
                            ),
                            child: Text(
                              l10n.educationGrade,
                              style: isArabic
                                  ? AppTypography.bodyMedium(
                                      color: AppColors.accentGreen,
                                      isArabic: true,
                                    ).copyWith(fontWeight: FontWeight.bold)
                                  : AppTypography.code(
                                      color: AppColors.accentGreen,
                                      fontSize: 12,
                                    ).copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
