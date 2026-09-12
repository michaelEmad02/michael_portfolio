import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radius.dart';
import 'app_network_image.dart';

class FullScreenImageViewer extends StatelessWidget {
  final String imageUrl;
  final String? assetFallback;
  final String? title;
  final String? subtitle;
  final bool isArabic;

  const FullScreenImageViewer({
    super.key,
    required this.imageUrl,
    this.assetFallback,
    this.title,
    this.subtitle,
    this.isArabic = false,
  });

  static void show(
    BuildContext context, {
    required String imageUrl,
    String? assetFallback,
    String? title,
    String? subtitle,
    bool isArabic = false,
  }) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.92),
      barrierDismissible: true,
      builder: (dialogContext) => FullScreenImageViewer(
        imageUrl: imageUrl,
        assetFallback: assetFallback,
        title: title,
        subtitle: subtitle,
        isArabic: isArabic,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.sizeOf(context);

    final displayTitle = title ?? AppConstants.developerName;
    final displaySubtitle = subtitle ??
        (isArabic
            ? 'مطور تطبيقات فلاتر وأنظمة برمجية متكاملة'
            : 'Flutter Developer & Software Engineer');

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
      child: Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: size.width > 900 ? 700 : size.width * 0.92,
                  maxHeight: size.height * 0.88,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Interactive Zoomable Image Frame
                    Flexible(
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF0A0E17),
                          borderRadius: BorderRadius.circular(AppRadius.lg),
                          border: Border.all(
                            color: (isDark
                                    ? AppColors.darkPrimary
                                    : AppColors.lightPrimary)
                                .withOpacity(0.35),
                            width: 1.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: (isDark
                                      ? AppColors.darkPrimary
                                      : AppColors.lightPrimary)
                                  .withOpacity(0.2),
                              blurRadius: 32,
                              offset: const Offset(0, 12),
                            ),
                            BoxShadow(
                              color: Colors.black.withOpacity(0.6),
                              blurRadius: 20,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(AppRadius.lg - 1),
                          child: InteractiveViewer(
                            minScale: 0.8,
                            maxScale: 4.0,
                            clipBehavior: Clip.antiAlias,
                            child: AppNetworkImage(
                              imageUrl: imageUrl,
                              assetFallback: assetFallback,
                              fit: BoxFit.contain,
                              fallbackIcon: Icons.person_rounded,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Info Card at Bottom
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF161B22).withOpacity(0.92),
                        borderRadius: BorderRadius.circular(AppRadius.md),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.12),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            blurRadius: 16,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
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
                                displayTitle,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            displaySubtitle,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.75),
                              fontSize: 13,
                              height: 1.4,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.pinch_rounded,
                                size: 14,
                                color: Colors.white.withOpacity(0.4),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                isArabic
                                    ? 'اسحب أو استخدم العجلة للتكبير والتحريك'
                                    : 'Pinch, drag or scroll to zoom & pan',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.4),
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Top-right Close Button
            Positioned(
              top: 8,
              right: 8,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  borderRadius: BorderRadius.circular(AppRadius.full),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFF161B22).withOpacity(0.85),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white.withOpacity(0.2),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.close_rounded,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
