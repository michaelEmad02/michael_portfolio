import 'package:flutter/material.dart';
import '../../../../core/localization/l10n.dart';
import '../../../../core/responsive/responsive_layout.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../shared/widgets/glass_card.dart';
import '../../../../shared/widgets/section_header.dart';
import '../../../../shared/widgets/tech_badge.dart';

class SkillItem {
  final String name;
  final IconData icon;

  const SkillItem(this.name, this.icon);
}

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isMobile = ResponsiveLayout.isMobile(context);
    final isArabic = context.isArabic;
    final l10n = context.l10n;

    final categories = [
      {
        'title': l10n.skillsMobile,
        'icon': Icons.phone_android_rounded,
        'color': AppColors.darkPrimary,
        'skills': const [
          SkillItem('Flutter', Icons.flutter_dash),
          SkillItem('Dart', Icons.code_rounded),
          SkillItem('BLoC / Cubit', Icons.sync_alt_rounded),
          SkillItem('Responsive UI', Icons.devices_rounded),
          SkillItem('Custom Animations', Icons.animation_rounded),
          SkillItem('State Management', Icons.stream_rounded),
        ],
      },
      {
        'title': l10n.skillsArchitecture,
        'icon': Icons.account_tree_outlined,
        'color': AppColors.accentGreen,
        'skills': const [
          SkillItem('Clean Architecture', Icons.layers_rounded),
          SkillItem('SOLID Principles', Icons.verified_user_rounded),
          SkillItem('Dependency Injection', Icons.alt_route_rounded),
          SkillItem('Repository Pattern', Icons.folder_copy_rounded),
          SkillItem('GetIt Locator', Icons.room_service_rounded),
          SkillItem('Singleton Pattern', Icons.fingerprint_rounded),
        ],
      },
      {
        'title': l10n.skillsBackend,
        'icon': Icons.cloud_outlined,
        'color': AppColors.darkSecondary,
        'skills': const [
          SkillItem('Supabase', Icons.bolt_rounded),
          SkillItem('Firebase Auth', Icons.lock_rounded),
          SkillItem('Cloud Firestore', Icons.local_fire_department_rounded),
          SkillItem('REST APIs', Icons.http_rounded),
          SkillItem('Dio (HTTP Client)', Icons.swap_vert_rounded),
          SkillItem('PostgreSQL', Icons.storage_rounded),
        ],
      },
      {
        'title': l10n.skillsStorage,
        'icon': Icons.storage_rounded,
        'color': AppColors.accentAmber,
        'skills': const [
          SkillItem('Hive NoSQL', Icons.dataset_rounded),
          SkillItem('SharedPreferences', Icons.save_rounded),
          SkillItem('SQL Server', Icons.table_chart_rounded),
          SkillItem('Offline Caching', Icons.cloud_off_rounded),
          SkillItem('Secure Storage', Icons.lock_outline_rounded),
        ],
      },
      {
        'title': l10n.skillsEnterprise,
        'icon': Icons.business_rounded,
        'color': const Color(0xFF38BDF8),
        'skills': const [
          SkillItem('C# / .NET', Icons.terminal_rounded),
          SkillItem('WinForms', Icons.desktop_windows_rounded),
          SkillItem('DevExpress', Icons.dashboard_customize_rounded),
          SkillItem('SQL Table Dependency', Icons.sync_rounded),
          SkillItem('ERP Systems', Icons.domain_rounded),
        ],
      },
      {
        'title': l10n.skillsAiTools,
        'icon': Icons.psychology_rounded,
        'color': const Color(0xFFA855F7),
        'skills': const [
          SkillItem('Cursor AI', Icons.auto_awesome_rounded),
          SkillItem('GitHub Copilot', Icons.smart_toy_rounded),
          SkillItem('Gemini', Icons.psychology_rounded),
          SkillItem('ChatGPT', Icons.chat_rounded),
          SkillItem('Google Antigravity', Icons.rocket_launch_rounded),
          SkillItem('Stitch', Icons.palette_rounded),
        ],
      },
    ];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 40 : 70,
        horizontal: 20,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1240),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionHeader(
                title: l10n.skillsSubtitle,
                subtitle: l10n.skillsTitle,
                // badgeText: '// TECHNICAL STACK',
              ),

              const SizedBox(height: 28),

              // Responsive Bento Grid (1 col on Mobile, 2 on Tablet, 3 on Desktop)
              LayoutBuilder(
                builder: (context, constraints) {
                  final isSmall = constraints.maxWidth < 640;
                  final crossAxisCount =
                      isSmall ? 1 : (constraints.maxWidth < 1000 ? 2 : 3);
                  final extent = isSmall ? 250.0 : 230.0;

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: categories.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      mainAxisExtent: extent,
                    ),
                    itemBuilder: (context, index) {
                      final item = categories[index];
                      final title = item['title'] as String;
                      final icon = item['icon'] as IconData;
                      final color = item['color'] as Color;
                      final skills = item['skills'] as List<SkillItem>;

                      return GlassCard(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: color.withOpacity(0.12),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Icon(icon, color: color, size: 20),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: isArabic
                                        ? AppTypography.bodyMedium(
                                            color: isDark
                                                ? AppColors.darkTextPrimary
                                                : AppColors.lightTextPrimary,
                                            isArabic: true,
                                          ).copyWith(
                                            fontWeight: FontWeight.bold)
                                        : AppTypography.code(
                                            color: isDark
                                                ? AppColors.darkTextPrimary
                                                : AppColors.lightTextPrimary,
                                            fontSize: 14,
                                          ).copyWith(
                                            fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Wrap(
                              spacing: 6,
                              runSpacing: 6,
                              children: skills.asMap().entries.map((entry) {
                                return _SlideInChip(
                                  index: entry.key,
                                  isArabic: isArabic,
                                  child: TechBadge(
                                    label: entry.value.name,
                                    icon: entry.value.icon,
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SlideInChip extends StatefulWidget {
  final Widget child;
  final int index;
  final bool isArabic;

  const _SlideInChip({
    required this.child,
    required this.index,
    required this.isArabic,
  });

  @override
  State<_SlideInChip> createState() => _SlideInChipState();
}

class _SlideInChipState extends State<_SlideInChip>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacity;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    final curved =
        CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic);
    _opacity = Tween<double>(begin: 0.0, end: 1.0).animate(curved);
    // Slide in from side: if Arabic (RTL) slide from right (+24), if English (LTR) slide from left (-24)
    final startX = widget.isArabic ? 24.0 : -24.0;
    _slide = Tween<Offset>(
      begin: Offset(startX, 0),
      end: Offset.zero,
    ).animate(curved);

    final delay = Duration(milliseconds: 60 * widget.index + 80);
    Future.delayed(delay, () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _opacity.value.clamp(0.0, 1.0),
          child: Transform.translate(
            offset: _slide.value,
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }
}
