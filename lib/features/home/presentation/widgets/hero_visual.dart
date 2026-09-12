import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/localization/l10n.dart';
import '../../../../core/responsive/responsive_layout.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../shared/widgets/app_network_image.dart';
import '../../../../shared/widgets/full_screen_image_viewer.dart';

class HeroVisual extends StatefulWidget {
  const HeroVisual({super.key});

  @override
  State<HeroVisual> createState() => _HeroVisualState();
}

class _HeroVisualState extends State<HeroVisual>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _floatingAnimation;
  late final Animation<double> _badgeFloat1;
  late final Animation<double> _badgeFloat2;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat(reverse: true);

    _floatingAnimation = Tween<double>(begin: -7.0, end: 7.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _badgeFloat1 = Tween<double>(begin: 4.0, end: -6.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.8, curve: Curves.easeInOut),
      ),
    );

    _badgeFloat2 = Tween<double>(begin: -5.0, end: 5.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 1.0, curve: Curves.easeInOut),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isMobile = ResponsiveLayout.isMobile(context);
    final isArabic = context.isArabic;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _floatingAnimation.value),
          child: child,
        );
      },
      child: Center(
        child: SizedBox(
          width: isMobile ? 320 : 440,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              // 1. Ambient Background Neon Glow Rings
              Positioned(
                top: -20,
                right: -20,
                child: Container(
                  width: 260,
                  height: 260,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        (isDark ? AppColors.darkPrimary : AppColors.lightPrimary)
                            .withOpacity(0.25),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: -20,
                left: -20,
                child: Container(
                  width: 240,
                  height: 240,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        (isDark ? AppColors.darkSecondary : AppColors.lightSecondary)
                            .withOpacity(0.2),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),

              // 2. Main Portrait Showcase Card
              Tooltip(
                message: isArabic
                    ? 'انقر لتكبير الصورة الشخصية'
                    : 'Click to view full photo',
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
                        borderRadius: BorderRadius.circular(28),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            (isDark ? AppColors.darkPrimary : AppColors.lightPrimary)
                                .withOpacity(0.4),
                            (isDark ? AppColors.darkSecondary : AppColors.lightSecondary)
                                .withOpacity(0.2),
                            (isDark ? Colors.white : Colors.black).withOpacity(0.05),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: (isDark
                                    ? AppColors.darkPrimary
                                    : AppColors.lightPrimary)
                                .withOpacity(0.22),
                            blurRadius: 36,
                            offset: const Offset(0, 14),
                          ),
                          BoxShadow(
                            color: Colors.black.withOpacity(0.35),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(3.0), // Sleek Neon Border
                      child: Container(
                        decoration: BoxDecoration(
                          color: isDark
                              ? const Color(0xFF0D131F)
                              : const Color(0xFFF1F5F9),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Stack(
                            children: [
                              // Portrait Image with smooth aspect ratio
                              const AspectRatio(
                                aspectRatio: 0.86,
                                child: AppNetworkImage(
                                  imageUrl: AppConstants.profileImageUrl,
                                  assetFallback: AppConstants.profileAssetPath,
                                  fit: BoxFit.cover,
                                  fallbackIcon: Icons.person_rounded,
                                ),
                              ),

                              // Bottom Gradient Fade with Quick Identity Overlay
                              Positioned(
                                left: 0,
                                right: 0,
                                bottom: 0,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 18,
                                    vertical: 16,
                                  ),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        Colors.black.withOpacity(0.92),
                                        Colors.black.withOpacity(0.65),
                                        Colors.transparent,
                                      ],
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Row(
                                        children: [
                                          Text(
                                            AppConstants.developerName,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 0.4,
                                            ),
                                          ),
                                          SizedBox(width: 6),
                                          Icon(
                                            Icons.verified_rounded,
                                            size: 18,
                                            color: AppColors.darkPrimary,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 3),
                                      Text(
                                        isArabic
                                            ? 'مهندس ومطور تطبيقات فلاتر وأنظمة ديسكتوب'
                                            : 'Flutter & Desktop ERP Software Engineer',
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.85),
                                          fontSize: 12.5,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              // Top Right: Fullscreen Zoom Hint Button
                              Positioned(
                                top: 12,
                                right: 12,
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.6),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white.withOpacity(0.25),
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.fullscreen_rounded,
                                    color: Colors.white,
                                    size: 18,
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
              ),

              // 3. Floating Tech Badge 1: Flutter Specialist (Top-Left)
              Positioned(
                top: -12,
                left: isMobile ? -10 : -28,
                child: Transform.translate(
                  offset: Offset(0, _badgeFloat1.value),
                  child: _buildFloatingBadge(
                    context,
                    icon: Icons.flutter_dash_rounded,
                    title: 'Flutter & Dart',
                    subtitle: isArabic ? 'تطبيقات عالية الأداء' : 'High Performance',
                    color: AppColors.darkPrimary,
                    isDark: isDark,
                  ),
                ),
              ),

              // 4. Floating Tech Badge 2: Clean Architecture & SOLID (Bottom-Right)
              Positioned(
                bottom: 30,
                right: isMobile ? -10 : -26,
                child: Transform.translate(
                  offset: Offset(0, _badgeFloat2.value),
                  child: _buildFloatingBadge(
                    context,
                    icon: Icons.architecture_rounded,
                    title: 'Clean Architecture',
                    subtitle: isArabic ? 'هندسة برمجيات متقدمة' : 'SOLID & Scalable',
                    color: AppColors.accentGreen,
                    isDark: isDark,
                  ),
                ),
              ),

              // 5. Floating Tech Badge 3: C# & ERP Enterprise (Bottom-Left)
              Positioned(
                bottom: -18,
                left: isMobile ? 8 : -14,
                child: Transform.translate(
                  offset: Offset(0, -_badgeFloat1.value),
                  child: _buildFloatingBadge(
                    context,
                    icon: Icons.business_center_rounded,
                    title: 'C# • SQL • ERP',
                    subtitle: isArabic ? 'أنظمة مؤسسية متكاملة' : 'Enterprise Solutions',
                    color: AppColors.accentAmber,
                    isDark: isDark,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFloatingBadge(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required bool isDark,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: (isDark ? const Color(0xFF131B2A) : Colors.white).withOpacity(0.92),
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(
          color: color.withOpacity(0.4),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.2),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              shape: BoxShape.circle,
              border: Border.all(
                color: color.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Icon(icon, size: 16, color: color),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  color: color,
                  fontSize: 10,
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
