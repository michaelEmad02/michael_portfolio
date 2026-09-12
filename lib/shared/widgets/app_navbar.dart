import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/app_links.dart';
import '../../core/di/injection_container.dart';
import '../../core/localization/l10n.dart';
import '../../core/routing/route_paths.dart';
import '../../core/services/url_launcher_service.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import 'custom_button.dart';
import 'language_toggle_button.dart';
import 'theme_toggle_button.dart';

class AppNavbar extends StatelessWidget implements PreferredSizeWidget {
  final Function(String sectionKey)? onSectionTap;
  final String? activeSection;

  const AppNavbar({
    super.key,
    this.onSectionTap,
    this.activeSection,
  });

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final width = MediaQuery.sizeOf(context).width;
    final isCompact = width < 960;
    final isArabic = context.isArabic;

    final bgColor = isDark
        ? AppColors.darkBackground.withOpacity(0.92)
        : AppColors.lightBackground.withOpacity(0.95);

    final borderColor = isDark
        ? AppColors.darkOutlineVariant.withOpacity(0.5)
        : AppColors.lightOutline.withOpacity(0.7);

    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        border: Border(bottom: BorderSide(color: borderColor, width: 1)),
      ),
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          height: 64,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1240),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width < 400 ? 12 : 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Logo & Brand
                    _buildLogo(context, isDark, isArabic, width),

                    // Desktop Navigation links
                    if (!isCompact) ...[
                      _buildNavLinks(context, isDark, isArabic),
                      _buildActions(context, isDark),
                    ] else ...[
                      // Mobile & Tablet Actions & Drawer button
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const ThemeToggleButton(),
                          const SizedBox(width: 4),
                          const LanguageToggleButton(),
                          const SizedBox(width: 4),
                          IconButton(
                            icon: const Icon(Icons.menu),
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(minWidth: 38, minHeight: 38),
                            color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                            onPressed: () => _openMobileMenu(context, isDark, isArabic),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo(BuildContext context, bool isDark, bool isArabic, double screenWidth) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (GoRouterState.of(context).uri.path != RoutePaths.home) {
            context.go(RoutePaths.home);
          } else {
            onSectionTap?.call('home');
          }
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkSurfaceContainerHigh : AppColors.lightSurfaceContainerHigh,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isDark ? AppColors.darkPrimary.withOpacity(0.5) : AppColors.lightPrimary.withOpacity(0.5),
                ),
              ),
              child: Center(
                child: Text(
                  'ME',
                  style: AppTypography.code(
                    color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
                    fontSize: 14,
                  ).copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            if (screenWidth >= 330) ...[
              const SizedBox(width: 10),
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
                          ).copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth < 380 ? 13 : 15,
                          )
                        : AppTypography.code(
                            color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                            fontSize: screenWidth < 380 ? 13 : 15,
                          ).copyWith(fontWeight: FontWeight.bold),
                  ),
                  if (screenWidth >= 380)
                    Text(
                      'Flutter Engineer',
                      style: AppTypography.code(
                        color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
                        fontSize: 10,
                      ),
                    ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildNavLinks(BuildContext context, bool isDark, bool isArabic) {
    final l10n = context.l10n;
    final items = [
      {'key': 'home', 'label': l10n.navHome},
      {'key': 'about', 'label': l10n.navAbout},
      {'key': 'skills', 'label': l10n.navSkills},
      {'key': 'projects', 'label': l10n.navProjects},
      {'key': 'experience', 'label': l10n.navExperience},
      {'key': 'contact', 'label': l10n.navContact},
    ];

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: items.map((item) {
        final key = item['key']!;
        final label = item['label']!;
        final isActive = activeSection == key;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                if (GoRouterState.of(context).uri.path != RoutePaths.home) {
                  context.go(RoutePaths.home);
                  // Allow navigation frame before scrolling
                  Future.delayed(const Duration(milliseconds: 100), () {
                    onSectionTap?.call(key);
                  });
                } else {
                  onSectionTap?.call(key);
                }
              },
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: isArabic
                    ? AppTypography.bodyMedium(
                        color: isActive
                            ? (isDark ? AppColors.darkPrimary : AppColors.lightPrimary)
                            : (isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary),
                        isArabic: true,
                      ).copyWith(fontWeight: isActive ? FontWeight.bold : FontWeight.w500)
                    : AppTypography.code(
                        color: isActive
                            ? (isDark ? AppColors.darkPrimary : AppColors.lightPrimary)
                            : (isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary),
                        fontSize: 13,
                      ).copyWith(fontWeight: isActive ? FontWeight.bold : FontWeight.w500),
                child: Text(label),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildActions(BuildContext context, bool isDark) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const ThemeToggleButton(),
        const SizedBox(width: 8),
        const LanguageToggleButton(),
        const SizedBox(width: 12),
        CustomButton(
          text: context.l10n.navDownloadCv,
          icon: Icons.download_rounded,
          variant: ButtonVariant.primary,
          height: 38,
          onPressed: () {
            sl<UrlLauncherService>().openUrl(AppLinks.cvDriveUrl);
          },
        ),
      ],
    );
  }

  void _openMobileMenu(BuildContext context, bool isDark, bool isArabic) {
    final l10n = context.l10n;
    final items = [
      {'key': 'home', 'label': l10n.navHome, 'icon': Icons.home_outlined},
      {'key': 'about', 'label': l10n.navAbout, 'icon': Icons.person_outline},
      {'key': 'skills', 'label': l10n.navSkills, 'icon': Icons.code_rounded},
      {'key': 'projects', 'label': l10n.navProjects, 'icon': Icons.folder_open_rounded},
      {'key': 'experience', 'label': l10n.navExperience, 'icon': Icons.work_outline},
      {'key': 'contact', 'label': l10n.navContact, 'icon': Icons.mail_outline},
    ];

    showModalBottomSheet(
      context: context,
      backgroundColor: isDark ? AppColors.darkSurfaceContainer : AppColors.lightSurface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (modalContext) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...items.map((item) {
                  return ListTile(
                    leading: Icon(
                      item['icon'] as IconData,
                      color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
                    ),
                    title: Text(
                      item['label'] as String,
                      style: isArabic
                          ? AppTypography.bodyLarge(
                              color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                              isArabic: true,
                            )
                          : AppTypography.code(
                              color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                            ),
                    ),
                    onTap: () {
                      Navigator.pop(modalContext);
                      if (GoRouterState.of(context).uri.path != RoutePaths.home) {
                        context.go(RoutePaths.home);
                        Future.delayed(const Duration(milliseconds: 100), () {
                          onSectionTap?.call(item['key'] as String);
                        });
                      } else {
                        onSectionTap?.call(item['key'] as String);
                      }
                    },
                  );
                }),
                const Divider(height: 24),
                CustomButton(
                  text: l10n.navDownloadCv,
                  icon: Icons.download_rounded,
                  variant: ButtonVariant.primary,
                  isFullWidth: true,
                  onPressed: () {
                    Navigator.pop(modalContext);
                    sl<UrlLauncherService>().openUrl(AppLinks.cvDriveUrl);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
