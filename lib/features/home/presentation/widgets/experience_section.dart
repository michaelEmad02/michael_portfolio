import 'package:flutter/material.dart';
import '../../../../core/localization/l10n.dart';
import '../../../../core/responsive/responsive_layout.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../shared/widgets/glass_card.dart';
import '../../../../shared/widgets/section_header.dart';
import '../../../../shared/widgets/tech_badge.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isMobile = ResponsiveLayout.isMobile(context);
    final isArabic = context.isArabic;
    final l10n = context.l10n;

    final experiences = [
      {
        'role': l10n.expFlutterTitle,
        'company': l10n.expFlutterCompany,
        'period': l10n.expFlutterPeriod,
        'desc': l10n.expFlutterDesc,
        'icon': Icons.flutter_dash_rounded,
        'accent': AppColors.darkPrimary,
        'tags': ['Flutter', 'Dart', 'BLoC/Cubit', 'Clean Architecture', 'Supabase', 'Firebase', 'REST APIs'],
        'isCurrent': true,
      },
      {
        'role': l10n.expDotnetTitle,
        'company': l10n.expDotnetCompany,
        'period': l10n.expDotnetPeriod,
        'desc': l10n.expDotnetDesc,
        'icon': Icons.desktop_windows_rounded,
        'accent': const Color(0xFF818CF8),
        'tags': ['C#', '.NET', 'WinForms', 'DevExpress', 'SQL Server', 'Real-Time Sync'],
        'isCurrent': false,
      },
      {
        'role': l10n.expDataSpecialistTitle,
        'company': l10n.expDataSpecialistCompany,
        'period': l10n.expDataSpecialistPeriod,
        'desc': l10n.expDataSpecialistDesc,
        'icon': Icons.corporate_fare_rounded,
        'accent': AppColors.accentGreen,
        'tags': ['Corporate Operations', 'Workflow Analysis', 'Enterprise Data Integrity'],
        'isCurrent': false,
      },
    ];

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
                title: l10n.experienceSubtitle,
                subtitle: l10n.experienceTitle,
                // badgeText: '// CAREER MILESTONES',
              ),

              const SizedBox(height: 32),

              Column(
                children: experiences.map((exp) {
                  final role = exp['role'] as String;
                  final company = exp['company'] as String;
                  final period = exp['period'] as String;
                  final desc = exp['desc'] as String;
                  final icon = exp['icon'] as IconData;
                  final accent = exp['accent'] as Color;
                  final tags = exp['tags'] as List<String>;
                  final isCurrent = exp['isCurrent'] as bool;

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: GlassCard(
                      padding: EdgeInsets.all(isMobile ? 18 : 28),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: accent.withOpacity(0.12),
                                  borderRadius: BorderRadius.circular(AppRadius.xs),
                                  border: Border.all(color: accent.withOpacity(0.4)),
                                ),
                                child: Icon(icon, color: accent, size: 22),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            role,
                                            style: AppTypography.headingSmall(
                                              color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                                              isArabic: isArabic,
                                            ),
                                          ),
                                        ),
                                        if (isCurrent)
                                          Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                            decoration: BoxDecoration(
                                              color: AppColors.accentGreen.withOpacity(0.15),
                                              borderRadius: BorderRadius.circular(12),
                                              border: Border.all(color: AppColors.accentGreen.withOpacity(0.5)),
                                            ),
                                            child: Text(
                                              isArabic ? 'حالي' : 'Present',
                                              style: AppTypography.code(
                                                color: AppColors.accentGreen,
                                                fontSize: 11,
                                              ).copyWith(fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '$company • $period',
                                      style: isArabic
                                          ? AppTypography.bodyMedium(
                                              color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
                                              isArabic: true,
                                            ).copyWith(fontWeight: FontWeight.w600)
                                          : AppTypography.code(
                                              color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
                                              fontSize: 13,
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            desc,
                            style: AppTypography.bodyMedium(
                              color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                              isArabic: isArabic,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Wrap(
                            spacing: 6,
                            runSpacing: 6,
                            children: tags.map((tag) => TechBadge(label: tag)).toList(),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
