import 'package:flutter/material.dart';
import '../../../../core/localization/l10n.dart';
import '../../../../core/responsive/responsive_layout.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../shared/widgets/glass_card.dart';
import '../../../../shared/widgets/section_header.dart';
import '../../../../shared/widgets/tech_badge.dart';

class ErpBackgroundSection extends StatelessWidget {
  const ErpBackgroundSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isMobile = ResponsiveLayout.isMobile(context);
    final isArabic = context.isArabic;
    final l10n = context.l10n;

    final highlights = [
      {'title': l10n.erpPoint1, 'icon': Icons.account_balance_wallet_outlined},
      {'title': l10n.erpPoint2, 'icon': Icons.inventory_2_outlined},
      {'title': l10n.erpPoint3, 'icon': Icons.hub_outlined},
      {'title': l10n.erpPoint4, 'icon': Icons.receipt_long_outlined},
    ];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 40 : 60,
        horizontal: 20,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1240),
          child: GlassCard(
            padding: EdgeInsets.all(isMobile ? 20 : 36),
            customBorderColor: isDark
                ? const Color(0xFF6366F1).withOpacity(0.4)
                : const Color(0xFF6366F1).withOpacity(0.25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionHeader(
                  title: l10n.erpSectionSubtitle,
                  subtitle: l10n.erpSectionTitle,
                  // badgeText: '// ENTERPRISE FOUNDATION',
                ),

                const SizedBox(height: 20),

                Text(
                  l10n.erpSectionDesc,
                  style: AppTypography.bodyLarge(
                    color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                    isArabic: isArabic,
                  ),
                ),

                const SizedBox(height: 24),

                // 2x2 Grid on desktop, Column on mobile
                LayoutBuilder(
                  builder: (context, constraints) {
                    final isSmall = constraints.maxWidth < 700;

                    if (isSmall) {
                      return Column(
                        children: highlights.map((item) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: _buildHighlightItem(item, isDark, isArabic),
                          );
                        }).toList(),
                      );
                    }

                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              _buildHighlightItem(highlights[0], isDark, isArabic),
                              const SizedBox(height: 12),
                              _buildHighlightItem(highlights[1], isDark, isArabic),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            children: [
                              _buildHighlightItem(highlights[2], isDark, isArabic),
                              const SizedBox(height: 12),
                              _buildHighlightItem(highlights[3], isDark, isArabic),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),

                const SizedBox(height: 24),

                const Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    TechBadge(label: 'Smart Daftar ERP', isPrimary: true),
                    TechBadge(label: 'MS SQL Server'),
                    TechBadge(label: 'SQL Table Dependency'),
                    TechBadge(label: 'C# / .NET'),
                    TechBadge(label: 'DevExpress Dashboards'),
                    TechBadge(label: 'FIFO / LIFO Valuation'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHighlightItem(
    Map<String, dynamic> item,
    bool isDark,
    bool isArabic,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.darkSurfaceContainerHighest.withOpacity(0.5)
            : AppColors.lightSurfaceContainerHigh,
        borderRadius: BorderRadius.circular(AppRadius.xs),
        border: Border.all(
          color: isDark ? AppColors.darkOutlineVariant : AppColors.lightOutline,
        ),
      ),
      child: Row(
        children: [
          Icon(
            item['icon'] as IconData,
            color: const Color(0xFF818CF8),
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              item['title'] as String,
              style: isArabic
                  ? AppTypography.bodyMedium(
                      color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                      isArabic: true,
                    ).copyWith(fontWeight: FontWeight.w600)
                  : AppTypography.code(
                      color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                      fontSize: 13,
                    ).copyWith(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
