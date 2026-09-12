import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class AppNetworkImage extends StatelessWidget {
  final String imageUrl;
  final String? assetFallback;
  final BoxFit fit;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final IconData fallbackIcon;

  const AppNetworkImage({
    super.key,
    required this.imageUrl,
    this.assetFallback,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.borderRadius,
    this.fallbackIcon = Icons.image_outlined,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    Widget imageWidget;
    if (imageUrl.startsWith('http://') || imageUrl.startsWith('https://')) {
      imageWidget = Image.network(
        imageUrl,
        width: width,
        height: height,
        fit: fit,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          final progress = loadingProgress.expectedTotalBytes != null
              ? loadingProgress.cumulativeBytesLoaded /
                  loadingProgress.expectedTotalBytes!
              : null;
          return Container(
            width: width,
            height: height,
            color: isDark
                ? AppColors.darkSurfaceContainerHigh
                : AppColors.lightSurfaceContainerHigh,
            alignment: Alignment.center,
            child: SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                value: progress,
                strokeWidth: 2,
                color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
              ),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          if (assetFallback != null) {
            return Image.asset(
              assetFallback!,
              width: width,
              height: height,
              fit: fit,
              errorBuilder: (_, __, ___) => _buildFallback(isDark),
            );
          }
          return _buildFallback(isDark);
        },
      );
    } else if (imageUrl.isNotEmpty) {
      // Local asset path
      imageWidget = Image.asset(
        imageUrl,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (_, __, ___) => _buildFallback(isDark),
      );
    } else if (assetFallback != null) {
      imageWidget = Image.asset(
        assetFallback!,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (_, __, ___) => _buildFallback(isDark),
      );
    } else {
      imageWidget = _buildFallback(isDark);
    }

    if (borderRadius != null) {
      return ClipRRect(
        borderRadius: borderRadius!,
        child: imageWidget,
      );
    }

    return imageWidget;
  }

  Widget _buildFallback(bool isDark) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.darkSurfaceContainerHighest
            : AppColors.lightSurfaceContainerHigh,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDark
              ? [
                  AppColors.darkSurfaceContainerHighest,
                  AppColors.darkSurfaceContainer,
                ]
              : [
                  AppColors.lightSurfaceContainerHigh,
                  AppColors.lightSurface,
                ],
        ),
      ),
      child: Center(
        child: Icon(
          fallbackIcon,
          size: 32,
          color: (isDark ? AppColors.darkPrimary : AppColors.lightPrimary)
              .withOpacity(0.5),
        ),
      ),
    );
  }
}
