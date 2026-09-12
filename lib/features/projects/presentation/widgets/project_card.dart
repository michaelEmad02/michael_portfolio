import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/localization/l10n.dart';
import '../../../../core/responsive/responsive_layout.dart';
import '../../../../core/routing/route_paths.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../shared/widgets/app_network_image.dart';
import '../../../../shared/widgets/custom_button.dart';
import '../../../../shared/widgets/glass_card.dart';
import '../../../../shared/widgets/tech_badge.dart';
import '../../domain/entities/project_entity.dart';

class ProjectCard extends StatelessWidget {
  final ProjectEntity project;
  final bool isTwoColumns;

  const ProjectCard({
    super.key,
    required this.project,
    this.isTwoColumns = true,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isArabic = context.isArabic;
    final isMobile = ResponsiveLayout.isMobile(context);
    final l10n = context.l10n;

    Widget bodyContent = Padding(
      padding: EdgeInsets.all(isMobile ? 18 : 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            project.title(isArabic),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTypography.headingSmall(
              color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
              isArabic: isArabic,
            ),
          ),

          const SizedBox(height: 6),

          // Subtitle
          isTwoColumns
              ? SizedBox(
                  height: 24,
                  child: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      project.subtitle(isArabic),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: isArabic
                          ? AppTypography.bodyMedium(
                              color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
                              isArabic: true,
                            ).copyWith(fontWeight: FontWeight.w600)
                          : AppTypography.code(
                              color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
                              fontSize: 13,
                            ).copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                )
              : Text(
                  project.subtitle(isArabic),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: isArabic
                      ? AppTypography.bodyMedium(
                          color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
                          isArabic: true,
                        ).copyWith(fontWeight: FontWeight.w600)
                      : AppTypography.code(
                          color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
                          fontSize: 13,
                        ).copyWith(fontWeight: FontWeight.w500),
                ),

          const SizedBox(height: 12),

          // Short Overview
          isTwoColumns
              ? SizedBox(
                  height: isArabic ? 72 : 66,
                  child: Text(
                    project.overview(isArabic),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.bodyMedium(
                      color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                      isArabic: isArabic,
                    ),
                  ),
                )
              : Text(
                  project.overview(isArabic),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.bodyMedium(
                    color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                    isArabic: isArabic,
                  ),
                ),

          const SizedBox(height: 18),

          // Tech Stack Badges
          isTwoColumns
              ? SizedBox(
                  height: 64,
                  child: Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: project.technologies.take(6).map((tech) {
                      return TechBadge(label: tech);
                    }).toList(),
                  ),
                )
              : Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: project.technologies.take(6).map((tech) {
                    return TechBadge(label: tech);
                  }).toList(),
                ),

          const SizedBox(height: 18),

          const Divider(height: 1),

          const SizedBox(height: 16),

          // Metrics row or Action buttons
          LayoutBuilder(
            builder: (context, constraints) {
              final isCompact = constraints.maxWidth < 360;

              if (isCompact) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.layers_outlined,
                          size: 14,
                          color: isDark ? AppColors.darkTextMuted : AppColors.lightTextMuted,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '${project.features(isArabic).length} ${isArabic ? 'ميزات معمارية' : 'Engineered Modules'}',
                          style: AppTypography.code(
                            color: isDark ? AppColors.darkTextMuted : AppColors.lightTextMuted,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    CustomButton(
                      text: l10n.projectViewDetails,
                      icon: isArabic ? Icons.arrow_back_rounded : Icons.arrow_forward_rounded,
                      variant: ButtonVariant.primary,
                      isFullWidth: true,
                      height: 38,
                      onPressed: () => context.push(RoutePaths.projectDetailsWithId(project.id)),
                    ),
                  ],
                );
              }

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Metrics count preview
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.layers_outlined,
                        size: 14,
                        color: isDark ? AppColors.darkTextMuted : AppColors.lightTextMuted,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '${project.features(isArabic).length} ${isArabic ? 'ميزات معمارية' : 'Engineered Modules'}',
                        style: AppTypography.code(
                          color: isDark ? AppColors.darkTextMuted : AppColors.lightTextMuted,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),

                  // View Details Button
                  CustomButton(
                    text: l10n.projectViewDetails,
                    icon: isArabic ? Icons.arrow_back_rounded : Icons.arrow_forward_rounded,
                    variant: ButtonVariant.primary,
                    height: 36,
                    onPressed: () => context.push(RoutePaths.projectDetailsWithId(project.id)),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );

    return GlassCard(
      padding: EdgeInsets.zero,
      onTap: () => context.push(RoutePaths.projectDetailsWithId(project.id)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Project Hero Image Banner (Loaded from Internet)
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(AppRadius.lg)),
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: AppNetworkImage(
                    imageUrl: project.heroImageUrl ?? '',
                    assetFallback: project.id == 'clinic-pro'
                        ? 'assets/images/clinic_pro_screen.png'
                        : 'assets/images/kemet_odyssey_screen.png',
                    fit: BoxFit.cover,
                    fallbackIcon: Icons.laptop_chromebook_rounded,
                  ),
                ),
                // Gradient Scrim for Contrast
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          (isDark ? AppColors.darkSurface : AppColors.lightSurface)
                              .withOpacity(0.85),
                        ],
                      ),
                    ),
                  ),
                ),
                // Header Floating Badges (Category & Featured)
                Positioned(
                  top: 12,
                  left: 12,
                  right: 12,
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 6,
                    alignment: WrapAlignment.spaceBetween,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: (isDark ? AppColors.darkSurface : AppColors.lightSurface)
                              .withOpacity(0.85),
                          borderRadius: BorderRadius.circular(AppRadius.xs),
                          border: Border.all(
                            color: isDark
                                ? AppColors.darkPrimary.withOpacity(0.4)
                                : AppColors.lightPrimary.withOpacity(0.4),
                          ),
                        ),
                        child: Text(
                          project.category(isArabic),
                          style: isArabic
                              ? AppTypography.bodyMedium(
                                  color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
                                  isArabic: true,
                                ).copyWith(fontSize: 11, fontWeight: FontWeight.w600)
                              : AppTypography.code(
                                  color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
                                  fontSize: 11,
                                ).copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                      if (project.isFeatured)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.accentAmber.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(AppRadius.xs),
                            border: Border.all(color: AppColors.accentAmber.withOpacity(0.6)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.star_rounded, size: 14, color: AppColors.accentAmber),
                              const SizedBox(width: 4),
                              Text(
                                l10n.projectFeatured,
                                style: isArabic
                                    ? AppTypography.bodyMedium(
                                        color: AppColors.accentAmber,
                                        isArabic: true,
                                      ).copyWith(fontSize: 11, fontWeight: FontWeight.bold)
                                    : AppTypography.code(
                                        color: AppColors.accentAmber,
                                        fontSize: 11,
                                      ).copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Card Body Content
          bodyContent,
        ],
      ),
    );
  }
}
