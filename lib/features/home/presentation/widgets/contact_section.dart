import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_links.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/localization/l10n.dart';
import '../../../../core/services/url_launcher_service.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../shared/widgets/custom_button.dart';
import '../../../../shared/widgets/glass_card.dart';
import '../../../../shared/widgets/section_header.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 768;
    final isArabic = context.isArabic;
    final l10n = context.l10n;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 40 : 80,
        horizontal: 20,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionHeader(
                title: l10n.contactSubtitle,
                subtitle: l10n.contactTitle,
                // badgeText: '// DIRECT CHANNELS',
              ),

              const SizedBox(height: 16),

              Text(
                l10n.contactPitch,
                style: AppTypography.bodyLarge(
                  color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                  isArabic: isArabic,
                ),
              ),

              const SizedBox(height: 36),

              // Responsive Contact Methods Grid / Column
              LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = constraints.maxWidth >= 720;

                  if (isWide) {
                    return Column(
                      children: [
                        // Row 1: WhatsApp (Featured Direct) & Email
                        Row(
                          children: [
                            Expanded(
                              child: _buildContactCard(
                                icon: FontAwesomeIcons.whatsapp,
                                title: l10n.contactWhatsapp,
                                subtitle: AppConstants.phone,
                                color: AppColors.accentGreen,
                                actionText: isArabic ? 'محادثة فورية' : 'Start WhatsApp Chat',
                                isDark: isDark,
                                isArabic: isArabic,
                                isHighlight: true,
                                onTap: () => sl<UrlLauncherService>().openWhatsApp(
                                  AppConstants.whatsappNumber,
                                  message: isArabic
                                      ? 'مرحباً مايكل، شاهدت معرض أعمالك وأود التواصل معك.'
                                      : 'Hello Michael, I saw your portfolio and would like to connect!',
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: _buildContactCard(
                                icon: Icons.mail_outline_rounded,
                                title: l10n.contactEmail,
                                subtitle: AppConstants.email,
                                color: AppColors.darkPrimary,
                                actionText: isArabic ? 'إرسال بريد' : 'Send Direct Email',
                                isDark: isDark,
                                isArabic: isArabic,
                                onTap: () => sl<UrlLauncherService>().openEmail(AppConstants.email),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // Row 2: Phone, LinkedIn, GitHub
                        Row(
                          children: [
                            Expanded(
                              child: _buildContactCard(
                                icon: Icons.phone_outlined,
                                title: l10n.contactPhone,
                                subtitle: AppConstants.phone,
                                color: const Color(0xFF818CF8),
                                actionText: isArabic ? 'اتصال مباشر' : 'Call Directly',
                                isDark: isDark,
                                isArabic: isArabic,
                                onTap: () => sl<UrlLauncherService>().openUrl('tel:${AppConstants.phone}'),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: _buildContactCard(
                                icon: FontAwesomeIcons.linkedin,
                                title: 'LinkedIn',
                                subtitle: 'Michael Emad',
                                color: const Color(0xFF0A66C2),
                                actionText: isArabic ? 'زيارة الملف' : 'View Profile',
                                isDark: isDark,
                                isArabic: isArabic,
                                onTap: () => sl<UrlLauncherService>().openUrl(AppLinks.linkedin),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: _buildContactCard(
                                icon: FontAwesomeIcons.github,
                                title: 'GitHub',
                                subtitle: 'Repositories & Code',
                                color: isDark ? AppColors.darkTextPrimary : const Color(0xFF24292E),
                                actionText: isArabic ? 'استعراض الأكواد' : 'Explore Code',
                                isDark: isDark,
                                isArabic: isArabic,
                                onTap: () => sl<UrlLauncherService>().openUrl(AppLinks.github),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }

                  // Mobile Single-Column List
                  return Column(
                    children: [
                      _buildContactCard(
                        icon: FontAwesomeIcons.whatsapp,
                        title: l10n.contactWhatsapp,
                        subtitle: AppConstants.phone,
                        color: AppColors.accentGreen,
                        actionText: isArabic ? 'محادثة فورية على واتساب' : 'Chat on WhatsApp',
                        isDark: isDark,
                        isArabic: isArabic,
                        isHighlight: true,
                        onTap: () => sl<UrlLauncherService>().openWhatsApp(
                          AppConstants.whatsappNumber,
                          message: isArabic
                              ? 'مرحباً مايكل، شاهدت معرض أعمالك وأود التواصل معك.'
                              : 'Hello Michael, I saw your portfolio and would like to connect!',
                        ),
                      ),
                      const SizedBox(height: 14),
                      _buildContactCard(
                        icon: Icons.mail_outline_rounded,
                        title: l10n.contactEmail,
                        subtitle: AppConstants.email,
                        color: AppColors.darkPrimary,
                        actionText: isArabic ? 'إرسال بريد إلكتروني' : 'Send Email',
                        isDark: isDark,
                        isArabic: isArabic,
                        onTap: () => sl<UrlLauncherService>().openEmail(AppConstants.email),
                      ),
                      const SizedBox(height: 14),
                      _buildContactCard(
                        icon: Icons.phone_outlined,
                        title: l10n.contactPhone,
                        subtitle: AppConstants.phone,
                        color: const Color(0xFF818CF8),
                        actionText: isArabic ? 'اتصال هاتفي' : 'Call Phone',
                        isDark: isDark,
                        isArabic: isArabic,
                        onTap: () => sl<UrlLauncherService>().openUrl('tel:${AppConstants.phone}'),
                      ),
                      const SizedBox(height: 14),
                      _buildContactCard(
                        icon: FontAwesomeIcons.linkedin,
                        title: 'LinkedIn',
                        subtitle: 'Michael Emad',
                        color: const Color(0xFF0A66C2),
                        actionText: isArabic ? 'الملف المهني' : 'View LinkedIn',
                        isDark: isDark,
                        isArabic: isArabic,
                        onTap: () => sl<UrlLauncherService>().openUrl(AppLinks.linkedin),
                      ),
                      const SizedBox(height: 14),
                      _buildContactCard(
                        icon: FontAwesomeIcons.github,
                        title: 'GitHub',
                        subtitle: 'Repositories & Code',
                        color: isDark ? AppColors.darkTextPrimary : const Color(0xFF24292E),
                        actionText: isArabic ? 'مستودعات الأكواد' : 'View GitHub',
                        isDark: isDark,
                        isArabic: isArabic,
                        onTap: () => sl<UrlLauncherService>().openUrl(AppLinks.github),
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: 32),

              // Availability & Quick Status Banner
              GlassCard(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: Row(
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      decoration: const BoxDecoration(
                        color: AppColors.accentGreen,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.accentGreen,
                            blurRadius: 8,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Text(
                        isArabic
                            ? 'متاح حالياً لفرص العمل كـ Flutter Developer والمشاريع المستقلة.'
                            : 'Currently open for Flutter Engineer opportunities & contracts.',
                        style: isArabic
                            ? AppTypography.bodyMedium(
                                color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                                isArabic: true,
                              ).copyWith(fontWeight: FontWeight.w600)
                            : AppTypography.code(
                                color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                                fontSize: 13,
                              ).copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(width: 12),
                    CustomButton(
                      text: isArabic ? 'تواصل الآن' : 'Connect',
                      icon: FontAwesomeIcons.whatsapp,
                      variant: ButtonVariant.primary,
                      height: 36,
                      onPressed: () => sl<UrlLauncherService>().openWhatsApp(
                        AppConstants.whatsappNumber,
                        message: isArabic
                            ? 'مرحباً مايكل، أود الحديث معك بشأن فرصة عمل جديدة.'
                            : 'Hello Michael, I would like to discuss a work opportunity with you.',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required String actionText,
    required VoidCallback onTap,
    required bool isDark,
    required bool isArabic,
    bool isHighlight = false,
  }) {
    return GlassCard(
      onTap: onTap,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(AppRadius.xs),
                  border: Border.all(
                    color: isHighlight ? color.withOpacity(0.6) : color.withOpacity(0.3),
                  ),
                ),
                child: Icon(icon, color: color, size: 20),
              ),
              Icon(
                isArabic ? Icons.arrow_back_rounded : Icons.arrow_forward_rounded,
                size: 16,
                color: isHighlight ? color : (isDark ? AppColors.darkTextMuted : AppColors.lightTextMuted),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            title,
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
          const SizedBox(height: 4),
          Text(
            subtitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTypography.code(
              color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            actionText,
            style: isArabic
                ? AppTypography.bodyMedium(
                    color: isHighlight ? color : (isDark ? AppColors.darkPrimary : AppColors.lightPrimary),
                    isArabic: true,
                  ).copyWith(fontSize: 12, fontWeight: FontWeight.w600)
                : AppTypography.code(
                    color: isHighlight ? color : (isDark ? AppColors.darkPrimary : AppColors.lightPrimary),
                    fontSize: 11,
                  ).copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
