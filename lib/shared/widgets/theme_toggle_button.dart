import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../state/theme_cubit.dart';
import '../../core/theme/app_colors.dart';
import '../../core/localization/l10n.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeCubit>().isDarkMode;

    return Tooltip(
      message: isDark ? context.l10n.themeLight : context.l10n.themeDark,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => context.read<ThemeCubit>().toggleTheme(),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isDark
                  ? AppColors.darkSurfaceContainerHigh
                  : AppColors.lightSurfaceContainerHigh,
              shape: BoxShape.circle,
              border: Border.all(
                color: isDark ? AppColors.darkOutlineVariant : AppColors.lightOutline,
              ),
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              transitionBuilder: (child, animation) =>
                  ScaleTransition(scale: animation, child: child),
              child: Icon(
                isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
                key: ValueKey<bool>(isDark),
                size: 20,
                color: isDark ? const Color(0xFFFACC15) : AppColors.lightPrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
