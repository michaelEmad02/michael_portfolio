import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/app_links.dart';
import '../../core/di/injection_container.dart';
import '../../core/localization/l10n.dart';
import '../../core/services/url_launcher_service.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final width = MediaQuery.sizeOf(context).width;
    final isCompact = width < 760;
    final isArabic = context.isArabic;
    final l10n = context.l10n;

    final borderColor = isDark ? AppColors.darkOutlineVariant : AppColors.lightOutline;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkBackground : AppColors.lightBackground,
        border: Border(top: BorderSide(color: borderColor)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1240),
          child: Column(
            children: [
              if (isCompact) ...[
                Column(
                  children: [
                    _buildBrandInfo(isDark, isArabic),
                    const SizedBox(height: 20),
                    _buildSocialRow(isDark),
                    const SizedBox(height: 24),
                    Text(
                      l10n.footerBuiltWith,
                      textAlign: TextAlign.center,
                      style: AppTypography.code(
                        color: isDark ? AppColors.darkTextMuted : AppColors.lightTextMuted,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      l10n.footerCopyright,
                      textAlign: TextAlign.center,
                      style: AppTypography.code(
                        color: isDark ? AppColors.darkTextMuted : AppColors.lightTextMuted,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ] else ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildBrandInfo(isDark, isArabic),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        _buildSocialRow(isDark),
                        const SizedBox(height: 12),
                        Text(
                          l10n.footerBuiltWith,
                          style: AppTypography.code(
                            color: isDark ? AppColors.darkTextMuted : AppColors.lightTextMuted,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          l10n.footerCopyright,
                          style: AppTypography.code(
                            color: isDark ? AppColors.darkTextMuted : AppColors.lightTextMuted,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBrandInfo(bool isDark, bool isArabic) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: isDark ? AppColors.darkSurfaceContainerHigh : AppColors.lightSurfaceContainerHigh,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: isDark ? AppColors.darkPrimary.withOpacity(0.4) : AppColors.lightPrimary.withOpacity(0.4),
            ),
          ),
          child: Center(
            child: Text(
              'ME',
              style: AppTypography.code(
                color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
                fontSize: 12,
              ).copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppConstants.developerName,
              style: isArabic
                  ? AppTypography.bodyMedium(
                      color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                      isArabic: true,
                    ).copyWith(fontWeight: FontWeight.bold)
                  : AppTypography.code(
                      color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                      fontSize: 14,
                    ).copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              AppConstants.developerRole,
              style: AppTypography.code(
                color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialRow(bool isDark) {
    final socials = [
      {'icon': FontAwesomeIcons.github, 'url': AppLinks.github, 'tooltip': 'GitHub'},
      {'icon': FontAwesomeIcons.linkedin, 'url': AppLinks.linkedin, 'tooltip': 'LinkedIn'},
      {'icon': FontAwesomeIcons.whatsapp, 'url': AppLinks.whatsapp, 'tooltip': 'WhatsApp'},
      {'icon': Icons.email_outlined, 'url': AppLinks.email, 'tooltip': 'Email'},
    ];

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: socials.map((s) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Tooltip(
            message: s['tooltip'] as String,
            child: IconButton(
              icon: Icon(s['icon'] as IconData, size: 20),
              color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
              hoverColor: isDark ? AppColors.darkPrimary.withOpacity(0.1) : AppColors.lightPrimary.withOpacity(0.1),
              onPressed: () {
                sl<UrlLauncherService>().openUrl(s['url'] as String);
              },
            ),
          ),
        );
      }).toList(),
    );
  }
}
