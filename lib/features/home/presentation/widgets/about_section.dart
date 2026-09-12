import 'package:flutter/material.dart';
import '../../../../core/localization/l10n.dart';
import '../../../../core/responsive/responsive_layout.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../shared/widgets/glass_card.dart';
import '../../../../shared/widgets/section_header.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isMobile = ResponsiveLayout.isMobile(context);
    final isArabic = context.isArabic;
    final l10n = context.l10n;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 40 : 70,
        horizontal: 20,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1240),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionHeader(
                title: l10n.aboutSubtitle,
                subtitle: l10n.aboutTitle,
                // badgeText: '// WHO I AM',
              ),

              const SizedBox(height: 28),

              // Bio Text Blocks
              GlassCard(
                padding: EdgeInsets.all(isMobile ? 20 : 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.aboutBio1,
                      style: AppTypography.bodyLarge(
                        color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                        isArabic: isArabic,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      l10n.aboutBio2,
                      style: AppTypography.bodyLarge(
                        color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                        isArabic: isArabic,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Core Standards: Scalable • Testable • Maintainable
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: (isDark ? AppColors.darkPrimary : AppColors.lightPrimary).withOpacity(0.06),
                        borderRadius: BorderRadius.circular(AppRadius.md),
                        border: Border.all(
                          color: (isDark ? AppColors.darkPrimary : AppColors.lightPrimary).withOpacity(0.2),
                        ),
                      ),
                      child: Column(
                        children: [
                          _buildEngineeringPill(
                            icon: Icons.trending_up_rounded,
                            title: l10n.aboutScalable,
                            desc: l10n.aboutScalableDesc,
                            color: AppColors.darkPrimary,
                            isDark: isDark,
                            isArabic: isArabic,
                          ),
                          const SizedBox(height: 12),
                          _buildEngineeringPill(
                            icon: Icons.checklist_rounded,
                            title: l10n.aboutTestable,
                            desc: l10n.aboutTestableDesc,
                            color: AppColors.accentGreen,
                            isDark: isDark,
                            isArabic: isArabic,
                          ),
                          const SizedBox(height: 12),
                          _buildEngineeringPill(
                            icon: Icons.build_circle_outlined,
                            title: l10n.aboutMaintainable,
                            desc: l10n.aboutMaintainableDesc,
                            color: AppColors.accentAmber,
                            isDark: isDark,
                            isArabic: isArabic,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // 3 Highlight Pillars
              isMobile
                  ? Column(
                      children: [
                        _buildPillarCard(
                          icon: Icons.phone_android_rounded,
                          title: l10n.aboutPillar1Title,
                          description: l10n.aboutPillar1Desc,
                          accentColor: AppColors.darkPrimary,
                          isDark: isDark,
                          isArabic: isArabic,
                        ),
                        const SizedBox(height: 16),
                        _buildPillarCard(
                          icon: Icons.architecture_rounded,
                          title: l10n.aboutPillar2Title,
                          description: l10n.aboutPillar2Desc,
                          accentColor: AppColors.accentGreen,
                          isDark: isDark,
                          isArabic: isArabic,
                        ),
                        const SizedBox(height: 16),
                        _buildPillarCard(
                          icon: Icons.cloud_done_rounded,
                          title: l10n.aboutPillar3Title,
                          description: l10n.aboutPillar3Desc,
                          accentColor: AppColors.darkSecondary,
                          isDark: isDark,
                          isArabic: isArabic,
                        ),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: _buildPillarCard(
                            icon: Icons.phone_android_rounded,
                            title: l10n.aboutPillar1Title,
                            description: l10n.aboutPillar1Desc,
                            accentColor: AppColors.darkPrimary,
                            isDark: isDark,
                            isArabic: isArabic,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: _buildPillarCard(
                            icon: Icons.architecture_rounded,
                            title: l10n.aboutPillar2Title,
                            description: l10n.aboutPillar2Desc,
                            accentColor: AppColors.accentGreen,
                            isDark: isDark,
                            isArabic: isArabic,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: _buildPillarCard(
                            icon: Icons.cloud_done_rounded,
                            title: l10n.aboutPillar3Title,
                            description: l10n.aboutPillar3Desc,
                            accentColor: AppColors.darkSecondary,
                            isDark: isDark,
                            isArabic: isArabic,
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPillarCard({
    required IconData icon,
    required String title,
    required String description,
    required Color accentColor,
    required bool isDark,
    required bool isArabic,
  }) {
    return GlassCard(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: accentColor.withOpacity(0.12),
              borderRadius: BorderRadius.circular(AppRadius.xs),
              border: Border.all(color: accentColor.withOpacity(0.4)),
            ),
            child: Icon(icon, color: accentColor, size: 24),
          ),
          const SizedBox(height: 18),
          Text(
            title,
            style: isArabic
                ? AppTypography.bodyLarge(
                    color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                    isArabic: true,
                  ).copyWith(fontWeight: FontWeight.bold)
                : AppTypography.code(
                    color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                    fontSize: 16,
                  ).copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: AppTypography.bodyMedium(
              color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
              isArabic: isArabic,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEngineeringPill({
    required IconData icon,
    required String title,
    required String desc,
    required Color color,
    required bool isDark,
    required bool isArabic,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.15),
            borderRadius: BorderRadius.circular(AppRadius.xs),
            border: Border.all(color: color.withOpacity(0.4)),
          ),
          child: Icon(icon, color: color, size: 18),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: isArabic
                    ? AppTypography.bodyMedium(
                        color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                        isArabic: true,
                      ).copyWith(fontWeight: FontWeight.bold)
                    : AppTypography.code(
                        color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                        fontSize: 13,
                      ).copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 2),
              Text(
                desc,
                style: isArabic
                    ? AppTypography.bodyMedium(
                        color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                        isArabic: true,
                      ).copyWith(fontSize: 12, height: 1.4)
                    : AppTypography.code(
                        color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                        fontSize: 12,
                      ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
