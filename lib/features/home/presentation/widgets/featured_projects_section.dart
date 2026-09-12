import 'package:flutter/material.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/localization/l10n.dart';
import '../../../../core/responsive/responsive_layout.dart';
import '../../../../shared/widgets/scroll_reveal.dart';
import '../../../../shared/widgets/section_header.dart';
import '../../../projects/domain/repositories/project_repository.dart';
import '../../../projects/presentation/widgets/project_card.dart';

class FeaturedProjectsSection extends StatelessWidget {
  const FeaturedProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    final l10n = context.l10n;
    final projects = sl<ProjectRepository>().getProjects();

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
                title: l10n.projectsSubtitle,
                subtitle: l10n.projectsTitle,
                // badgeText: '// FEATURED CODEBASE',
              ),

              const SizedBox(height: 32),

              // 2 Column on Desktop/Tablet, 1 Column on Mobile
              LayoutBuilder(
                builder: (context, constraints) {
                  final isSingleCol = constraints.maxWidth < 900;

                  if (isSingleCol) {
                    return Column(
                      children: [
                        for (int i = 0; i < projects.length; i++)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 24),
                            child: ScrollReveal(
                              delay: Duration(milliseconds: i * 150),
                              child: ProjectCard(
                                project: projects[i],
                                isTwoColumns: false,
                              ),
                            ),
                          ),
                      ],
                    );
                  }

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (int i = 0; i < projects.length; i++) ...[
                        if (i > 0) const SizedBox(width: 24),
                        Expanded(
                          child: ScrollReveal(
                            delay: Duration(milliseconds: i * 180),
                            child: ProjectCard(
                              project: projects[i],
                              isTwoColumns: true,
                            ),
                          ),
                        ),
                      ],
                    ],
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
