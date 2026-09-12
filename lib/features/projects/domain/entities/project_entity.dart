class ArchitectureLayer {
  final String name;
  final String description;
  final List<String> items;

  const ArchitectureLayer({
    required this.name,
    required this.description,
    required this.items,
  });
}

class ProjectFeature {
  final String title;
  final String description;
  final String iconCode;

  const ProjectFeature({
    required this.title,
    required this.description,
    required this.iconCode,
  });
}

class ProjectChallenge {
  final String challenge;
  final String solution;

  const ProjectChallenge({
    required this.challenge,
    required this.solution,
  });
}

class ProjectScreenshot {
  final String imageUrl;
  final String titleEn;
  final String titleAr;
  final String descriptionEn;
  final String descriptionAr;

  const ProjectScreenshot({
    required this.imageUrl,
    required this.titleEn,
    required this.titleAr,
    required this.descriptionEn,
    required this.descriptionAr,
  });

  String title(bool isArabic) => isArabic ? titleAr : titleEn;
  String description(bool isArabic) => isArabic ? descriptionAr : descriptionEn;
}

class ProjectEntity {
  final String id; // 'clinic-pro', 'kemet-odyssey'
  final String titleEn;
  final String titleAr;
  final String subtitleEn;
  final String subtitleAr;
  final String categoryEn;
  final String categoryAr;
  final String overviewEn;
  final String overviewAr;
  final String problemEn;
  final String problemAr;
  final String solutionEn;
  final String solutionAr;
  final List<String> technologies;
  final List<ProjectFeature> featuresEn;
  final List<ProjectFeature> featuresAr;
  final List<ProjectFeature> userFeaturesEn;
  final List<ProjectFeature> userFeaturesAr;
  final List<ArchitectureLayer> architectureEn;
  final List<ArchitectureLayer> architectureAr;
  final List<ProjectChallenge> challengesEn;
  final List<ProjectChallenge> challengesAr;
  final List<String> contributionsEn;
  final List<String> contributionsAr;
  final List<ProjectScreenshot> screenshots;
  final String? heroImageUrl;
  final String? githubUrl;
  final String? liveUrl;
  final String? downloadUrl;
  final bool isFeatured;
  final Map<String, String> metrics;

  const ProjectEntity({
    required this.id,
    required this.titleEn,
    required this.titleAr,
    required this.subtitleEn,
    required this.subtitleAr,
    required this.categoryEn,
    required this.categoryAr,
    required this.overviewEn,
    required this.overviewAr,
    required this.problemEn,
    required this.problemAr,
    required this.solutionEn,
    required this.solutionAr,
    required this.technologies,
    required this.featuresEn,
    required this.featuresAr,
    this.userFeaturesEn = const [],
    this.userFeaturesAr = const [],
    required this.architectureEn,
    required this.architectureAr,
    required this.challengesEn,
    required this.challengesAr,
    required this.contributionsEn,
    required this.contributionsAr,
    this.screenshots = const [],
    this.heroImageUrl,
    this.githubUrl,
    this.liveUrl,
    this.downloadUrl,
    this.isFeatured = true,
    this.metrics = const {},
  });

  String title(bool isArabic) => isArabic ? titleAr : titleEn;
  String subtitle(bool isArabic) => isArabic ? subtitleAr : subtitleEn;
  String category(bool isArabic) => isArabic ? categoryAr : categoryEn;
  String overview(bool isArabic) => isArabic ? overviewAr : overviewEn;
  String problem(bool isArabic) => isArabic ? problemAr : problemEn;
  String solution(bool isArabic) => isArabic ? solutionAr : solutionEn;
  List<ProjectFeature> features(bool isArabic) => isArabic ? featuresAr : featuresEn;
  List<ProjectFeature> userFeatures(bool isArabic) => isArabic ? userFeaturesAr : userFeaturesEn;
  List<ArchitectureLayer> architecture(bool isArabic) => isArabic ? architectureAr : architectureEn;
  List<ProjectChallenge> challenges(bool isArabic) => isArabic ? challengesAr : challengesEn;
  List<String> contributions(bool isArabic) => isArabic ? contributionsAr : contributionsEn;
}
