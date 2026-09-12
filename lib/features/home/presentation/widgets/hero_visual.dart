import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/localization/l10n.dart';
import '../../../../core/responsive/responsive_layout.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../shared/widgets/app_network_image.dart';
import '../../../../shared/widgets/full_screen_image_viewer.dart';

class HeroVisual extends StatelessWidget {
  const HeroVisual({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isMobile = ResponsiveLayout.isMobile(context);
    final isArabic = context.isArabic;
    final screenWidth = MediaQuery.sizeOf(context).width;

    if (isMobile) {
      return _buildMobileLayout(context, isDark, isArabic, screenWidth);
    } else {
      return _buildDesktopLayout(context, isDark, isArabic);
    }
  }

  // ==========================================
  // MOBILE LAYOUT (Clean, Static, No Overlapping)
  // ==========================================
  Widget _buildMobileLayout(
    BuildContext context,
    bool isDark,
    bool isArabic,
    double screenWidth,
  ) {
    final cardWidth = (screenWidth * 0.85).clamp(280.0, 340.0);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // 1. Portrait Card
        SizedBox(
          width: cardWidth,
          child: _buildPortraitCard(
            context,
            isDark: isDark,
            isArabic: isArabic,
            showBottomIdentity: true,
          ),
        ),

        const SizedBox(height: 18),

        // 2. Badges neatly arranged below the photo
        SizedBox(
          width: cardWidth + 20,
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildBadge(
                context,
                icon: Icons.flutter_dash_rounded,
                title: 'Flutter & Dart',
                subtitle: isArabic ? 'تطبيقات عالية الأداء' : 'High Performance',
                color: AppColors.darkPrimary,
                isDark: isDark,
                compact: true,
              ),
              _buildBadge(
                context,
                icon: Icons.architecture_rounded,
                title: 'Clean Architecture',
                subtitle: isArabic ? 'هندسة برمجيات متقدمة' : 'SOLID & Scalable',
                color: AppColors.accentGreen,
                isDark: isDark,
                compact: true,
              ),
              _buildBadge(
                context,
                icon: Icons.business_center_rounded,
                title: 'C# • SQL • ERP',
                subtitle: isArabic ? 'أنظمة مؤسسية متكاملة' : 'Enterprise Systems',
                color: AppColors.accentAmber,
                isDark: isDark,
                compact: true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ==========================================
  // DESKTOP LAYOUT (Clean Static Editorial Card)
  // ==========================================
  Widget _buildDesktopLayout(
    BuildContext context,
    bool isDark,
    bool isArabic,
  ) {
    return Center(
      child: SizedBox(
        width: 400,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            // Ambient Glow Background
            Positioned(
              top: -24,
              right: -24,
              child: Container(
                width: 280,
                height: 280,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      (isDark ? AppColors.darkPrimary : AppColors.lightPrimary)
                          .withOpacity(0.18),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),

            // Main Portrait Card
            _buildPortraitCard(
              context,
              isDark: isDark,
              isArabic: isArabic,
              showBottomIdentity: true,
            ),

            // Badge 1: Flutter (Top-Left)
            Positioned(
              top: 24,
              left: -36,
              child: _buildBadge(
                context,
                icon: Icons.flutter_dash_rounded,
                title: 'Flutter & Dart',
                subtitle: isArabic ? 'تطبيقات عالية الأداء' : 'High Performance',
                color: AppColors.darkPrimary,
                isDark: isDark,
              ),
            ),

            // Badge 2: Clean Architecture (Bottom-Right)
            Positioned(
              bottom: 48,
              right: -36,
              child: _buildBadge(
                context,
                icon: Icons.architecture_rounded,
                title: 'Clean Architecture',
                subtitle: isArabic ? 'هندسة برمجيات متقدمة' : 'SOLID & Scalable',
                color: AppColors.accentGreen,
                isDark: isDark,
              ),
            ),

            // Badge 3: C# • SQL • ERP (Bottom-Left)
            Positioned(
              bottom: -20,
              left: -12,
              child: _buildBadge(
                context,
                icon: Icons.business_center_rounded,
                title: 'C# • SQL • ERP',
                subtitle: isArabic ? 'أنظمة مؤسسية متكاملة' : 'Enterprise Systems',
                color: AppColors.accentAmber,
                isDark: isDark,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ==========================================
  // PORTRAIT CARD WIDGET
  // ==========================================
  Widget _buildPortraitCard(
    BuildContext context, {
    required bool isDark,
    required bool isArabic,
    required bool showBottomIdentity,
  }) {
    return Tooltip(
      message: isArabic ? 'انقر لتكبير الصورة الشخصية' : 'Click to view full photo',
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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  (isDark ? AppColors.darkPrimary : AppColors.lightPrimary)
                      .withOpacity(0.55),
                  (isDark ? AppColors.darkSecondary : AppColors.lightSecondary)
                      .withOpacity(0.3),
                  (isDark ? Colors.white : Colors.black).withOpacity(0.1),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: (isDark ? AppColors.darkPrimary : AppColors.lightPrimary)
                      .withOpacity(0.25),
                  blurRadius: 30,
                  offset: const Offset(0, 12),
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.35),
                  blurRadius: 18,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            padding: const EdgeInsets.all(2.5),
            child: Container(
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF0C1017) : const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(23.5),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(23.5),
                child: Stack(
                  children: [
                    // Portrait Image (Aspect Ratio 0.82 shows face and suit cleanly)
                    const AspectRatio(
                      aspectRatio: 0.82,
                      child: AppNetworkImage(
                        imageUrl: AppConstants.profileImageUrl,
                        assetFallback: AppConstants.profileAssetPath,
                        fit: BoxFit.cover,
                        fallbackIcon: Icons.person_rounded,
                      ),
                    ),

                    // Bottom Identity Overlay
                    if (showBottomIdentity)
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.black.withOpacity(0.92),
                                Colors.black.withOpacity(0.6),
                                Colors.transparent,
                              ],
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: isArabic
                                ? CrossAxisAlignment.end
                                : CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    AppConstants.developerName,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.5,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.3,
                                    ),
                                  ),
                                  SizedBox(width: 6),
                                  Icon(
                                    Icons.verified_rounded,
                                    size: 16,
                                    color: AppColors.darkPrimary,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 2),
                              Text(
                                isArabic
                                    ? 'مهندس ومطور تطبيقات فلاتر وأنظمة ديسكتوب'
                                    : 'Flutter & Desktop ERP Software Engineer',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.85),
                                  fontSize: 11.5,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                    // Top-Right Zoom Icon Badge
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.55),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white.withOpacity(0.25),
                          ),
                        ),
                        child: const Icon(
                          Icons.fullscreen_rounded,
                          color: Colors.white,
                          size: 17,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ==========================================
  // BADGE WIDGET
  // ==========================================
  Widget _buildBadge(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required bool isDark,
    bool compact = false,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 10 : 13,
        vertical: compact ? 6 : 8,
      ),
      decoration: BoxDecoration(
        color: (isDark ? const Color(0xFF131B2A) : Colors.white).withOpacity(0.94),
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(
          color: color.withOpacity(0.45),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.18),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.18),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(compact ? 5.5 : 7),
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              shape: BoxShape.circle,
              border: Border.all(
                color: color.withOpacity(0.35),
                width: 1,
              ),
            ),
            child: Icon(icon, size: compact ? 14 : 16, color: color),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                  fontSize: compact ? 11 : 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  color: color,
                  fontSize: compact ? 9 : 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
