import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/localization/l10n.dart';
import '../../../../core/responsive/responsive_layout.dart';
import '../../../../core/routing/route_paths.dart';
import '../../../../core/services/url_launcher_service.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../shared/widgets/app_footer.dart';
import '../../../../shared/widgets/app_navbar.dart';
import '../../../../shared/widgets/app_network_image.dart';
import '../../../../shared/widgets/custom_button.dart';
import '../../../../shared/widgets/glass_card.dart';
import '../../../../shared/widgets/scroll_reveal.dart';
import '../../../../shared/widgets/section_header.dart';
import '../../../../shared/widgets/tech_badge.dart';
import '../../domain/entities/project_entity.dart';
import '../../domain/repositories/project_repository.dart';
import '../widgets/project_screenshots_gallery.dart';

class ProjectDetailsPage extends StatelessWidget {
  final String projectId;

  const ProjectDetailsPage({
    super.key,
    required this.projectId,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isMobile = ResponsiveLayout.isMobile(context);
    final isArabic = context.isArabic;
    final l10n = context.l10n;

    final project = sl<ProjectRepository>().getProjectById(projectId);

    if (project == null) {
      return Scaffold(
        appBar: const AppNavbar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Project not found',
                style: AppTypography.headingMedium(
                  color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                ),
              ),
              const SizedBox(height: 16),
              CustomButton(
                text: l10n.projectBackToPortfolio,
                icon: Icons.arrow_back_rounded,
                onPressed: () => context.go(RoutePaths.home),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: const AppNavbar(),
      body: SelectionArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: isMobile ? 30 : 60,
                  horizontal: 20,
                ),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1240),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Back Button
                        CustomButton(
                          text: l10n.projectBackToPortfolio,
                          icon: isArabic ? Icons.arrow_forward_rounded : Icons.arrow_back_rounded,
                          variant: ButtonVariant.ghost,
                          height: 38,
                          onPressed: () {
                            if (context.canPop()) {
                              context.pop();
                            } else {
                              context.go(RoutePaths.home);
                            }
                          },
                        ),

                        const SizedBox(height: 24),

                        // Project Header
                        ScrollReveal(
                          child: _buildProjectHeader(context, project, isDark, isArabic, isMobile, l10n),
                        ),

                        const SizedBox(height: 36),

                        // Metrics Bar
                        ScrollReveal(
                          delay: const Duration(milliseconds: 100),
                          child: _buildMetricsBar(project, isDark, isArabic),
                        ),

                        const SizedBox(height: 48),

                        // Non-technical End-User Features
                        ScrollReveal(
                          child: _buildUserFeaturesSection(project, isDark, isArabic, isMobile, l10n),
                        ),

                        const SizedBox(height: 48),

                        // Visual Suite / Screenshots Gallery
                        ScrollReveal(
                          child: _buildScreenshotsSection(project, isDark, isArabic, isMobile, l10n),
                        ),

                        const SizedBox(height: 48),

                        // Problem & Solution
                        ScrollReveal(
                          child: _buildProblemSolution(project, isDark, isArabic, isMobile),
                        ),

                        const SizedBox(height: 48),

                        // Core Features (Technical)
                        ScrollReveal(
                          child: _buildFeaturesSection(project, isDark, isArabic, isMobile, l10n),
                        ),

                        const SizedBox(height: 48),

                        // Clean Architecture Flow
                        ScrollReveal(
                          child: _buildArchitectureSection(project, isDark, isArabic, isMobile, l10n),
                        ),

                        const SizedBox(height: 48),

                        // Challenges & Solutions
                        ScrollReveal(
                          child: _buildChallengesSection(project, isDark, isArabic, isMobile, l10n),
                        ),

                        const SizedBox(height: 48),

                        // Bottom Actions
                        ScrollReveal(
                          child: Center(
                            child: Wrap(
                              spacing: 16,
                              runSpacing: 12,
                              children: [
                                if (project.githubUrl != null)
                                  CustomButton(
                                    text: l10n.projectGithub,
                                    icon: FontAwesomeIcons.github,
                                    variant: ButtonVariant.primary,
                                    onPressed: () => sl<UrlLauncherService>().openUrl(project.githubUrl!),
                                  ),
                                if (project.downloadUrl != null)
                                  CustomButton(
                                    text: l10n.projectDownload,
                                    icon: Icons.download_rounded,
                                    variant: ButtonVariant.primary,
                                    onPressed: () => sl<UrlLauncherService>().openUrl(project.downloadUrl!),
                                  ),
                                CustomButton(
                                  text: l10n.projectBackToPortfolio,
                                  icon: isArabic ? Icons.arrow_forward_rounded : Icons.arrow_back_rounded,
                                  variant: ButtonVariant.outlined,
                                  onPressed: () {
                                    if (context.canPop()) {
                                      context.pop();
                                    } else {
                                      context.go(RoutePaths.home);
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const AppFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProjectHeader(
    BuildContext context,
    ProjectEntity project,
    bool isDark,
    bool isArabic,
    bool isMobile,
    dynamic l10n,
  ) {
    final leftInfo = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: isDark
                    ? AppColors.darkPrimary.withOpacity(0.12)
                    : AppColors.lightPrimary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppRadius.xs),
                border: Border.all(
                  color: isDark
                      ? AppColors.darkPrimary.withOpacity(0.4)
                      : AppColors.lightPrimary.withOpacity(0.4),
                ),
              ),
              child: Text(
                project.category(isArabic),
                style: AppTypography.code(
                  color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
                  fontSize: 12,
                ).copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        Text(
          project.title(isArabic),
          style: AppTypography.headingLarge(
            color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
            isArabic: isArabic,
          ),
        ),

        const SizedBox(height: 8),

        Text(
          project.subtitle(isArabic),
          style: isArabic
              ? AppTypography.bodyLarge(
                  color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
                  isArabic: true,
                ).copyWith(fontWeight: FontWeight.bold)
              : AppTypography.code(
                  color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
                  fontSize: 16,
                ).copyWith(fontWeight: FontWeight.w600),
        ),

        const SizedBox(height: 18),

        Text(
          project.overview(isArabic),
          style: AppTypography.bodyLarge(
            color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
            isArabic: isArabic,
          ),
        ),

        const SizedBox(height: 20),

        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: project.technologies
              .map((t) => TechBadge(label: t, isPrimary: true))
              .toList(),
        ),

        const SizedBox(height: 24),

        // Quick action links
        Wrap(
          spacing: 12,
          runSpacing: 10,
          children: [
            if (project.githubUrl != null)
              CustomButton(
                text: l10n.projectGithub,
                icon: FontAwesomeIcons.github,
                variant: ButtonVariant.primary,
                height: 38,
                onPressed: () => sl<UrlLauncherService>().openUrl(project.githubUrl!),
              ),
            if (project.downloadUrl != null)
              CustomButton(
                text: l10n.projectDownload,
                icon: Icons.download_rounded,
                variant: ButtonVariant.primary,
                height: 38,
                onPressed: () => sl<UrlLauncherService>().openUrl(project.downloadUrl!),
              ),
            if (project.liveUrl != null)
              CustomButton(
                text: l10n.projectLiveDemo,
                icon: Icons.open_in_new_rounded,
                variant: ButtonVariant.outlined,
                height: 38,
                onPressed: () => sl<UrlLauncherService>().openUrl(project.liveUrl!),
              ),
          ],
        ),
      ],
    );

    final rightMockup = _buildHeroMockup(project, isDark, isArabic);
    final width = MediaQuery.sizeOf(context).width;
    final isStacked = width < 920;

    if (isStacked) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          leftInfo,
          const SizedBox(height: 32),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: rightMockup,
            ),
          ),
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(flex: 7, child: leftInfo),
        const SizedBox(width: 36),
        Expanded(flex: 5, child: rightMockup),
      ],
    );
  }

  Widget _buildHeroMockup(ProjectEntity project, bool isDark, bool isArabic) {
    final isDesktopProject = project.id == 'smart-daftar';
    final isClinic = project.id == 'clinic-pro';

    final badgeTitle = isClinic
        ? (isArabic ? 'كفاءة الطابور اللحظي' : 'Queue Efficiency')
        : isDesktopProject
            ? (isArabic ? 'مزامنة شبكية لحظية' : 'Real-time LAN Sync')
            : (isArabic ? 'جاهزية العمل دون إنترنت' : 'Offline Readiness');

    final badgeSubtitle = isClinic
        ? (isArabic ? 'مزامنة نشطة بنسبة 99.8%' : 'Real-time sync active (99.8%)')
        : isDesktopProject
            ? (isArabic ? 'بدون Polling عبر SQL Dependency' : 'Zero-polling SQL Dependency')
            : (isArabic ? 'حفظ وتخزين محلي 100%' : '100% Cached Local Sites');

    final badgeMetric = isClinic
        ? '+24% vs avg'
        : isDesktopProject
            ? '0ms Latency'
            : 'Instant 60fps';

    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF0D1117) : const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(
          color: (isDark ? AppColors.darkPrimary : AppColors.lightPrimary).withOpacity(0.35),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: (isDark ? AppColors.darkPrimary : AppColors.lightPrimary).withOpacity(0.15),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppRadius.lg - 1),
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: isDesktopProject ? 12 : 20,
                  horizontal: 16,
                ),
                child: AspectRatio(
                  aspectRatio: isDesktopProject ? (16 / 10) : (9 / 16),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(isDesktopProject ? AppRadius.md : 24),
                      border: Border.all(
                        color: isDesktopProject
                            ? Colors.transparent
                            : (isDark ? const Color(0xFF30363D) : const Color(0xFFCBD5E1)),
                        width: isDesktopProject ? 0 : 3.0,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(isDark ? 0.45 : 0.15),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(isDesktopProject ? AppRadius.md : 20),
                      child: AppNetworkImage(
                        imageUrl: project.heroImageUrl ?? '',
                        assetFallback: isClinic
                            ? 'assets/images/clinic_pro_screen.png'
                            : 'assets/images/kemet_odyssey_screen.png',
                        fit: isDesktopProject ? BoxFit.cover : BoxFit.contain,
                        fallbackIcon: isDesktopProject
                            ? Icons.laptop_chromebook_rounded
                            : Icons.phone_android_rounded,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Live Status Pill
            Positioned(
              left: 12,
              right: 12,
              bottom: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: (isDark ? AppColors.darkSurfaceContainerHighest : Colors.white).withOpacity(0.92),
                  borderRadius: BorderRadius.circular(AppRadius.md),
                  border: Border.all(
                    color: (isDark ? AppColors.darkOutlineVariant : AppColors.lightOutline).withOpacity(0.4),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: (isDark ? AppColors.darkPrimary : AppColors.lightPrimary).withOpacity(0.15),
                        borderRadius: BorderRadius.circular(AppRadius.xs),
                      ),
                      child: Icon(
                        isClinic
                            ? Icons.insights_rounded
                            : isDesktopProject
                                ? Icons.storage_rounded
                                : Icons.offline_bolt_rounded,
                        size: 18,
                        color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            badgeTitle,
                            style: AppTypography.code(
                              color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                              fontSize: 12,
                            ).copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            badgeSubtitle,
                            style: AppTypography.bodyMedium(
                              color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                              isArabic: isArabic,
                            ).copyWith(fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.accentGreen.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(AppRadius.xs),
                      ),
                      child: Text(
                        badgeMetric,
                        style: AppTypography.code(
                          color: AppColors.accentGreen,
                          fontSize: 11,
                        ).copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserFeaturesSection(
    ProjectEntity project,
    bool isDark,
    bool isArabic,
    bool isMobile,
    dynamic l10n,
  ) {
    final features = project.userFeatures(isArabic);
    if (features.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: l10n.projectUserFeatures,
          subtitle: l10n.projectUserFeaturesSubtitle,
          // badgeText: '// CLIENT & USER EXPERIENCE',
        ),
        const SizedBox(height: 20),
        LayoutBuilder(
          builder: (context, constraints) {
            final isSmall = constraints.maxWidth < 640;
            final crossAxisCount = isSmall ? 1 : 2;
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: features.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                mainAxisExtent: isSmall ? 155 : 140,
              ),
              itemBuilder: (context, index) {
                final feature = features[index];
                return GlassCard(
                  padding: const EdgeInsets.all(18),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: (isDark ? AppColors.darkPrimary : AppColors.lightPrimary).withOpacity(0.12),
                          borderRadius: BorderRadius.circular(AppRadius.xs),
                        ),
                        child: Icon(
                          _getUserFeatureIcon(feature.iconCode),
                          color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
                          size: 22,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              feature.title,
                              style: isArabic
                                  ? AppTypography.bodyLarge(
                                      color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                                      isArabic: true,
                                    ).copyWith(fontWeight: FontWeight.bold)
                                  : AppTypography.code(
                                      color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                                      fontSize: 14,
                                    ).copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              feature.description,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: AppTypography.bodyMedium(
                                color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                                isArabic: isArabic,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildScreenshotsSection(
    ProjectEntity project,
    bool isDark,
    bool isArabic,
    bool isMobile,
    dynamic l10n,
  ) {
    if (project.screenshots.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: l10n.projectScreenshots,
          subtitle: l10n.projectScreenshotsSubtitle,
          // badgeText: '// VISUAL SUITE',
        ),
        const SizedBox(height: 24),
        ProjectScreenshotsGallery(
          screenshots: project.screenshots,
          isArabic: isArabic,
          isMobileProject: project.id != 'smart-daftar',
        ),
      ],
    );
  }

  IconData _getUserFeatureIcon(String code) {
    switch (code) {
      case 'calendar':
        return Icons.calendar_month_rounded;
      case 'queue':
        return Icons.groups_rounded;
      case 'payment':
        return Icons.payments_rounded;
      case 'history':
        return Icons.history_edu_rounded;
      case 'itinerary':
        return Icons.route_rounded;
      case 'offline':
        return Icons.cloud_off_rounded;
      case 'map':
        return Icons.map_rounded;
      case 'reviews':
        return Icons.rate_review_rounded;
      case 'analytics':
        return Icons.insights_rounded;
      case 'medical':
        return Icons.medical_services_rounded;
      case 'people':
        return Icons.badge_rounded;
      case 'security':
        return Icons.shield_rounded;
      case 'image':
        return Icons.image_search_rounded;
      case 'file':
        return Icons.description_rounded;
      case 'share':
        return Icons.link_rounded;
      case 'receipt':
        return Icons.receipt_long_rounded;
      case 'inventory':
        return Icons.inventory_2_rounded;
      case 'pos':
        return Icons.point_of_sale_rounded;
      case 'money':
        return Icons.account_balance_rounded;
      case 'database':
        return Icons.storage_rounded;
      case 'chart':
        return Icons.bar_chart_rounded;
      case 'backup':
        return Icons.backup_rounded;
      default:
        return Icons.star_outline_rounded;
    }
  }

  Widget _buildMetricsBar(ProjectEntity project, bool isDark, bool isArabic) {
    if (project.metrics.isEmpty) return const SizedBox.shrink();

    return GlassCard(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
      child: Wrap(
        spacing: 32,
        runSpacing: 16,
        alignment: WrapAlignment.spaceAround,
        children: project.metrics.entries.map((entry) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                entry.value,
                style: AppTypography.code(
                  color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
                  fontSize: 16,
                ).copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                entry.key,
                style: AppTypography.code(
                  color: isDark ? AppColors.darkTextMuted : AppColors.lightTextMuted,
                  fontSize: 11,
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildProblemSolution(ProjectEntity project, bool isDark, bool isArabic, bool isMobile) {
    final problemCard = GlassCard(
      padding: const EdgeInsets.all(24),
      customBorderColor: AppColors.accentRose.withOpacity(0.3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.warning_amber_rounded, color: AppColors.accentRose, size: 22),
              const SizedBox(width: 10),
              Text(
                isArabic ? 'التحدي والمشكلة' : 'The Challenge & Problem',
                style: isArabic
                    ? AppTypography.bodyLarge(color: AppColors.accentRose, isArabic: true).copyWith(fontWeight: FontWeight.bold)
                    : AppTypography.code(color: AppColors.accentRose, fontSize: 15).copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            project.problem(isArabic),
            style: AppTypography.bodyMedium(
              color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
              isArabic: isArabic,
            ),
          ),
        ],
      ),
    );

    final solutionCard = GlassCard(
      padding: const EdgeInsets.all(24),
      customBorderColor: AppColors.accentGreen.withOpacity(0.3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.check_circle_outline_rounded, color: AppColors.accentGreen, size: 22),
              const SizedBox(width: 10),
              Text(
                isArabic ? 'الحل الهندسي' : 'Engineered Solution',
                style: isArabic
                    ? AppTypography.bodyLarge(color: AppColors.accentGreen, isArabic: true).copyWith(fontWeight: FontWeight.bold)
                    : AppTypography.code(color: AppColors.accentGreen, fontSize: 15).copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            project.solution(isArabic),
            style: AppTypography.bodyMedium(
              color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
              isArabic: isArabic,
            ),
          ),
        ],
      ),
    );

    if (isMobile) {
      return Column(
        children: [
          problemCard,
          const SizedBox(height: 16),
          solutionCard,
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: problemCard),
        const SizedBox(width: 20),
        Expanded(child: solutionCard),
      ],
    );
  }

  Widget _buildFeaturesSection(
    ProjectEntity project,
    bool isDark,
    bool isArabic,
    bool isMobile,
    dynamic l10n,
  ) {
    final features = project.features(isArabic);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: l10n.projectCoreFeatures,
          // badgeText: '// CORE CAPABILITIES',
        ),

        const SizedBox(height: 20),

        LayoutBuilder(
          builder: (context, constraints) {
            final isSingleCol = constraints.maxWidth < 750;

            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: features.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isSingleCol ? 1 : 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                mainAxisExtent: isSingleCol ? 145 : 130,
              ),
              itemBuilder: (context, index) {
                final feat = features[index];
                return GlassCard(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        feat.title,
                        style: isArabic
                            ? AppTypography.bodyMedium(
                                color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                                isArabic: true,
                              ).copyWith(fontWeight: FontWeight.bold)
                            : AppTypography.code(
                                color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                                fontSize: 14,
                              ).copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 6),
                      Expanded(
                        child: Text(
                          feat.description,
                          style: AppTypography.bodyMedium(
                            color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                            isArabic: isArabic,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildArchitectureSection(
    ProjectEntity project,
    bool isDark,
    bool isArabic,
    bool isMobile,
    dynamic l10n,
  ) {
    final layers = project.architecture(isArabic);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: l10n.projectArchitectureFlow,
          // badgeText: '// CLEAN ARCHITECTURE',
        ),

        const SizedBox(height: 20),

        Column(
          children: layers.map((layer) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: GlassCard(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          layer.name,
                          style: isArabic
                              ? AppTypography.bodyLarge(
                                  color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
                                  isArabic: true,
                                ).copyWith(fontWeight: FontWeight.bold)
                              : AppTypography.code(
                                  color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
                                  fontSize: 15,
                                ).copyWith(fontWeight: FontWeight.bold),
                        ),
                        const Icon(Icons.layers_outlined, size: 18, color: AppColors.darkPrimary),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      layer.description,
                      style: AppTypography.bodyMedium(
                        color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                        isArabic: isArabic,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: layer.items.map((it) => TechBadge(label: it)).toList(),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildChallengesSection(
    ProjectEntity project,
    bool isDark,
    bool isArabic,
    bool isMobile,
    dynamic l10n,
  ) {
    final challenges = project.challenges(isArabic);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: l10n.projectChallenges,
          // badgeText: '// PROBLEMS SOLVED',
        ),

        const SizedBox(height: 20),

        Column(
          children: challenges.map((ch) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: GlassCard(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '• ${ch.challenge}',
                      style: isArabic
                          ? AppTypography.bodyMedium(
                              color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                              isArabic: true,
                            ).copyWith(fontWeight: FontWeight.bold)
                          : AppTypography.code(
                              color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                              fontSize: 14,
                            ).copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isDark ? AppColors.darkSurfaceContainerHighest : AppColors.lightSurfaceContainerHigh,
                        borderRadius: BorderRadius.circular(AppRadius.xs),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.bolt_rounded, size: 16, color: AppColors.accentAmber),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              ch.solution,
                              style: AppTypography.bodyMedium(
                                color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                                isArabic: isArabic,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
