import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_links.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/localization/l10n.dart';
import '../../../../core/services/url_launcher_service.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../shared/widgets/app_network_image.dart';
import '../../../../shared/widgets/custom_button.dart';
import '../../../../shared/widgets/full_screen_image_viewer.dart';
import 'hero_visual.dart';

class HeroSection extends StatefulWidget {
  final VoidCallback? onViewProjects;
  final VoidCallback? onContactMe;

  const HeroSection({
    super.key,
    this.onViewProjects,
    this.onContactMe,
  });

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final width = MediaQuery.sizeOf(context).width;
    final isStacked = width < 920;
    final isArabic = context.isArabic;
    final l10n = context.l10n;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: isStacked ? 40 : 80,
        horizontal: 20,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1240),
          child: isStacked
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildContent(context, isDark, isArabic, l10n, isStacked),
                    const SizedBox(height: 48),
                    Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 560),
                        child: const HeroVisual(),
                      ),
                    ),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 6,
                      child: _buildContent(
                          context, isDark, isArabic, l10n, isStacked),
                    ),
                    const SizedBox(width: 48),
                    const Expanded(
                      flex: 5,
                      child: HeroVisual(),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    bool isDark,
    bool isArabic,
    dynamic l10n,
    bool isMobile,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Top Row: Profile Photo Avatar + Availability Status Chip
        Row(
          children: [
            Tooltip(
              message: isArabic
                  ? 'انقر لتكبير الصورة الشخصية'
                  : 'Click to view profile photo',
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => FullScreenImageViewer.show(
                    context,
                    imageUrl: AppConstants.profileImageUrl,
                    assetFallback: AppConstants.profileAssetPath,
                    isArabic: isArabic,
                  ),
                  child: Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isDark
                            ? AppColors.darkPrimary
                            : AppColors.lightPrimary,
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: (isDark
                                  ? AppColors.darkPrimary
                                  : AppColors.lightPrimary)
                              .withOpacity(0.3),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: const ClipOval(
                      child: AppNetworkImage(
                        imageUrl: AppConstants.profileImageUrl,
                        assetFallback: AppConstants.profileAssetPath,
                        width: 44,
                        height: 44,
                        fit: BoxFit.cover,
                        fallbackIcon: Icons.person_rounded,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: isDark
                    ? AppColors.darkSurfaceContainerHigh
                    : AppColors.lightSurfaceContainerHigh,
                borderRadius: BorderRadius.circular(AppRadius.full),
                border: Border.all(
                  color: isDark
                      ? AppColors.darkOutlineVariant
                      : AppColors.lightOutline,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: AppColors.accentGreen,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    l10n.heroAvailableForHire,
                    style: isArabic
                        ? AppTypography.bodyMedium(
                            color: isDark
                                ? AppColors.darkTextPrimary
                                : AppColors.lightTextPrimary,
                            isArabic: true,
                          ).copyWith(fontSize: 12, fontWeight: FontWeight.bold)
                        : AppTypography.code(
                            color: isDark
                                ? AppColors.darkTextPrimary
                                : AppColors.lightTextPrimary,
                            fontSize: 12,
                          ).copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 24),

        // Greeting
        Text(
          l10n.heroGreeting,
          style: isArabic
              ? AppTypography.bodyLarge(
                  color:
                      isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
                  isArabic: true,
                ).copyWith(fontWeight: FontWeight.bold)
              : AppTypography.code(
                  color:
                      isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
                  fontSize: 18,
                ).copyWith(fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 8),

        // Name
        Text(
          l10n.heroName,
          style: AppTypography.headingLarge(
            color:
                isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
            isArabic: isArabic,
          ),
        ),

        const SizedBox(height: 6),

        // Role
        Text(
          AppConstants.developerRole,
          style: isArabic
              ? AppTypography.headingSmall(
                  color:
                      isDark ? const Color(0xFF7BD0FF) : AppColors.lightPrimary,
                  isArabic: true,
                ).copyWith(fontWeight: FontWeight.w700)
              : AppTypography.headingSmall(
                  color:
                      isDark ? const Color(0xFF7BD0FF) : AppColors.lightPrimary,
                ).copyWith(fontWeight: FontWeight.w700),
        ),

        const SizedBox(height: 20),

        // Bio pitch
        Text(
          l10n.heroDescription,
          style: AppTypography.bodyLarge(
            color: isDark
                ? AppColors.darkTextSecondary
                : AppColors.lightTextSecondary,
            isArabic: isArabic,
          ),
        ),

        const SizedBox(height: 32),

        // CTAs & Social Links
        Wrap(
          spacing: 12,
          runSpacing: 12,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            CustomButton(
              text: l10n.heroCtaProjects,
              icon: Icons.grid_view_rounded,
              variant: ButtonVariant.primary,
              height: 44,
              onPressed: widget.onViewProjects,
            ),
            CustomButton(
              text: l10n.heroCtaContact,
              icon: Icons.send_rounded,
              variant: ButtonVariant.outlined,
              height: 44,
              onPressed: widget.onContactMe,
            ),
          ],
        ),

        const SizedBox(height: 36),

        // Quick Social Buttons
        Row(
          children: [
            _buildSocialIcon(
              FontAwesomeIcons.github,
              'GitHub',
              AppLinks.github,
              isDark,
            ),
            const SizedBox(width: 8),
            _buildSocialIcon(
              FontAwesomeIcons.linkedin,
              'LinkedIn',
              AppLinks.linkedin,
              isDark,
            ),
            const SizedBox(width: 8),
            _buildSocialIcon(
              FontAwesomeIcons.whatsapp,
              'WhatsApp',
              AppLinks.whatsapp,
              isDark,
            ),
            const SizedBox(width: 8),
            _buildSocialIcon(
              Icons.email_outlined,
              'Email',
              AppLinks.email,
              isDark,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialIcon(
    IconData icon,
    String tooltip,
    String url,
    bool isDark,
  ) {
    return Tooltip(
      message: tooltip,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => sl<UrlLauncherService>().openUrl(url),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: isDark
                  ? AppColors.darkSurfaceContainerHigh
                  : AppColors.lightSurfaceContainerHigh,
              borderRadius: BorderRadius.circular(AppRadius.xs),
              border: Border.all(
                color: isDark
                    ? AppColors.darkOutlineVariant
                    : AppColors.lightOutline,
              ),
            ),
            child: Icon(
              icon,
              size: 18,
              color: isDark
                  ? AppColors.darkTextPrimary
                  : AppColors.lightTextPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
