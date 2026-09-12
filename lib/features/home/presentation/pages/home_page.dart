import 'package:flutter/material.dart';
import '../../../../shared/widgets/app_footer.dart';
import '../../../../shared/widgets/app_navbar.dart';
import '../../../../shared/widgets/scroll_reveal.dart';
import '../widgets/about_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/education_section.dart';
import '../widgets/erp_background_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/featured_projects_section.dart';
import '../widgets/hero_section.dart';
import '../widgets/skills_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  String _activeSection = 'home';

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(String sectionKey) {
    GlobalKey? targetKey;
    switch (sectionKey) {
      case 'home':
        targetKey = _homeKey;
        break;
      case 'about':
        targetKey = _aboutKey;
        break;
      case 'skills':
        targetKey = _skillsKey;
        break;
      case 'projects':
        targetKey = _projectsKey;
        break;
      case 'experience':
        targetKey = _experienceKey;
        break;
      case 'contact':
        targetKey = _contactKey;
        break;
    }

    if (targetKey?.currentContext != null) {
      setState(() => _activeSection = sectionKey);
      Scrollable.ensureVisible(
        targetKey!.currentContext!,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppNavbar(
        activeSection: _activeSection,
        onSectionTap: _scrollToSection,
      ),
      body: SafeArea(
        child: SelectionArea(
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                Container(
                  key: _homeKey,
                  child: HeroSection(
                    onViewProjects: () => _scrollToSection('projects'),
                    onContactMe: () => _scrollToSection('contact'),
                  ),
                ),
                Container(
                  key: _aboutKey,
                  child: const ScrollReveal(
                    child: AboutSection(),
                  ),
                ),
                Container(
                  key: _skillsKey,
                  child: const ScrollReveal(
                    child: SkillsSection(),
                  ),
                ),
                Container(
                  key: _projectsKey,
                  child: const ScrollReveal(
                    child: FeaturedProjectsSection(),
                  ),
                ),
                Container(
                  key: _experienceKey,
                  child: const ScrollReveal(
                    child: ExperienceSection(),
                  ),
                ),
                const ScrollReveal(
                  child: ErpBackgroundSection(),
                ),
                const ScrollReveal(
                  child: EducationSection(),
                ),
                Container(
                  key: _contactKey,
                  child: const ScrollReveal(
                    child: ContactSection(),
                  ),
                ),
                const ScrollReveal(
                  child: AppFooter(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
