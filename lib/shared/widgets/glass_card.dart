import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radius.dart';

class GlassCard extends StatefulWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final VoidCallback? onTap;
  final bool enableHoverEffect;
  final Color? customBorderColor;

  const GlassCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.onTap,
    this.enableHoverEffect = true,
    this.customBorderColor,
  });

  @override
  State<GlassCard> createState() => _GlassCardState();
}

class _GlassCardState extends State<GlassCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final baseBorderColor = widget.customBorderColor ??
        (isDark ? AppColors.darkOutlineVariant : AppColors.lightOutline);

    final hoverBorderColor = isDark
        ? AppColors.darkPrimary.withOpacity(0.6)
        : AppColors.lightPrimary.withOpacity(0.8);

    final backgroundColor = isDark
        ? (_isHovered
            ? AppColors.darkSurfaceContainerHigh
            : AppColors.darkSurfaceContainer)
        : (_isHovered
            ? AppColors.lightSurfaceContainerHigh
            : AppColors.lightSurfaceContainer);

    Widget content = AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      width: widget.width,
      height: widget.height,
      margin: widget.margin,
      padding: widget.padding ?? const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(
          color: (_isHovered && widget.enableHoverEffect)
              ? hoverBorderColor
              : baseBorderColor,
          width: (_isHovered && widget.enableHoverEffect) ? 1.5 : 1.0,
        ),
        boxShadow: [
          if (isDark && _isHovered && widget.enableHoverEffect)
            BoxShadow(
              color: AppColors.darkPrimary.withOpacity(0.08),
              blurRadius: 20,
              spreadRadius: 2,
            )
          else if (!isDark)
            BoxShadow(
              color: Colors.black.withOpacity(_isHovered ? 0.06 : 0.03),
              blurRadius: _isHovered ? 16 : 8,
              offset: const Offset(0, 4),
            ),
        ],
      ),
      child: widget.child,
    );

    if (widget.onTap != null) {
      content = MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: content,
        ),
      );
    } else if (widget.enableHoverEffect) {
      content = MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: content,
      );
    }

    return content;
  }
}
