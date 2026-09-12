import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radius.dart';
import '../../core/theme/app_typography.dart';
import '../../core/localization/l10n.dart';

enum ButtonVariant { primary, outlined, ghost }

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final ButtonVariant variant;
  final bool isFullWidth;
  final double? height;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
    this.variant = ButtonVariant.primary,
    this.isFullWidth = false,
    this.height = 46,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isArabic = context.isArabic;

    Color bgColor;
    Color textColor;
    Border? border;

    switch (widget.variant) {
      case ButtonVariant.primary:
        bgColor = isDark
            ? (_isHovered ? const Color(0xFF7BD0FF) : AppColors.darkPrimary)
            : (_isHovered ? const Color(0xFF0369A1) : AppColors.lightPrimary);
        textColor = isDark ? AppColors.darkOnPrimary : AppColors.lightOnPrimary;
        border = null;
        break;

      case ButtonVariant.outlined:
        bgColor = _isHovered
            ? (isDark
                ? AppColors.darkPrimary.withOpacity(0.12)
                : AppColors.lightPrimary.withOpacity(0.08))
            : Colors.transparent;
        textColor = isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
        border = Border.all(
          color: _isHovered
              ? (isDark ? AppColors.darkPrimary : AppColors.lightPrimary)
              : (isDark ? AppColors.darkOutline : AppColors.lightOutlineVariant),
          width: 1.2,
        );
        break;

      case ButtonVariant.ghost:
        bgColor = _isHovered
            ? (isDark
                ? AppColors.darkSurfaceContainerHigh
                : AppColors.lightSurfaceContainerHigh)
            : Colors.transparent;
        textColor = isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
        border = null;
        break;
    }

    final childWidget = AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      height: widget.height,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(AppRadius.xs),
        border: border,
        boxShadow: [
          if (widget.variant == ButtonVariant.primary && _isHovered)
            BoxShadow(
              color: (isDark ? AppColors.darkPrimary : AppColors.lightPrimary)
                  .withOpacity(0.25),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
        ],
      ),
      child: Row(
        mainAxisSize: widget.isFullWidth ? MainAxisSize.max : MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.icon != null) ...[
            Icon(widget.icon, size: 18, color: textColor),
            const SizedBox(width: 8),
          ],
          Text(
            widget.text,
            style: isArabic
                ? AppTypography.bodyMedium(color: textColor, isArabic: true).copyWith(
                    fontWeight: FontWeight.w700,
                  )
                : AppTypography.code(color: textColor, fontSize: 13).copyWith(
                    fontWeight: FontWeight.w600,
                  ),
          ),
        ],
      ),
    );

    return MouseRegion(
      cursor: widget.onPressed != null
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: childWidget,
      ),
    );
  }
}
