import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../shared/widgets/app_network_image.dart';
import '../../../../shared/widgets/glass_card.dart';
import '../../domain/entities/project_entity.dart';

class ProjectScreenshotsGallery extends StatefulWidget {
  final List<ProjectScreenshot> screenshots;
  final bool isArabic;
  final bool isMobileProject;

  const ProjectScreenshotsGallery({
    super.key,
    required this.screenshots,
    this.isArabic = false,
    this.isMobileProject = true,
  });

  @override
  State<ProjectScreenshotsGallery> createState() =>
      _ProjectScreenshotsGalleryState();
}

class _ProjectScreenshotsGalleryState extends State<ProjectScreenshotsGallery> {
  int _selectedIndex = 0;
  late PageController _pageController;
  final ScrollController _thumbScrollController = ScrollController();
  double _lastViewportFraction = 0.32;

  @override
  void initState() {
    super.initState();
    _lastViewportFraction = _getViewportFraction(1200);
    _pageController = PageController(
      initialPage: _selectedIndex,
      viewportFraction: _lastViewportFraction,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _thumbScrollController.dispose();
    super.dispose();
  }

  double _getViewportFraction(double screenWidth) {
    if (widget.isMobileProject) {
      if (screenWidth >= 1200) return 0.28;
      if (screenWidth >= 900) return 0.36;
      if (screenWidth >= 600) return 0.52;
      return 0.72;
    } else {
      if (screenWidth >= 1200) return 0.62;
      if (screenWidth >= 800) return 0.75;
      return 0.88;
    }
  }

  void _updateControllerIfNeeded(double screenWidth) {
    final newFraction = _getViewportFraction(screenWidth);
    if ((newFraction - _lastViewportFraction).abs() > 0.01) {
      _lastViewportFraction = newFraction;
      final oldIndex = _selectedIndex;
      _pageController.dispose();
      _pageController = PageController(
        initialPage: oldIndex,
        viewportFraction: newFraction,
      );
    }
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _scrollThumbnailsTo(index);
  }

  void _scrollThumbnailsTo(int index) {
    if (_thumbScrollController.hasClients) {
      final itemWidth = (widget.isMobileProject ? 72.0 : 130.0) + 12.0;
      final targetOffset = (index * itemWidth) - 100;
      _thumbScrollController.animateTo(
        targetOffset.clamp(
          0.0,
          _thumbScrollController.position.maxScrollExtent,
        ),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToPage(int index) {
    if (index >= 0 && index < widget.screenshots.length) {
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOutCubic,
      );
    }
  }

  void _nextImage() {
    if (_selectedIndex < widget.screenshots.length - 1) {
      _goToPage(_selectedIndex + 1);
    } else {
      _goToPage(0);
    }
  }

  void _prevImage() {
    if (_selectedIndex > 0) {
      _goToPage(_selectedIndex - 1);
    } else {
      _goToPage(widget.screenshots.length - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.screenshots.isEmpty) return const SizedBox.shrink();

    final screenWidth = MediaQuery.sizeOf(context).width;
    _updateControllerIfNeeded(screenWidth);

    final isDark = Theme.of(context).brightness == Brightness.dark;
    final activeScreenshot = widget.screenshots[_selectedIndex];
    final isMobile = widget.isMobileProject;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 3D Interactive Multi-Device Carousel Showcase
        Container(
          width: double.infinity,
          height: isMobile ? 540 : 460,
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF090D14) : const Color(0xFFF1F5F9),
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(
              color: (isDark ? AppColors.darkOutlineVariant : AppColors.lightOutline).withOpacity(0.4),
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // 3D Carousel with PageView builder
              Positioned.fill(
                child: ScrollConfiguration(
                  behavior: const MaterialScrollBehavior().copyWith(
                    dragDevices: {
                      PointerDeviceKind.touch,
                      PointerDeviceKind.mouse,
                      PointerDeviceKind.trackpad,
                    },
                  ),
                  child: AnimatedBuilder(
                    animation: _pageController,
                    builder: (context, child) {
                      double pageOffset = 0.0;
                      if (_pageController.hasClients &&
                          _pageController.position.haveDimensions) {
                        pageOffset = _pageController.page ?? _selectedIndex.toDouble();
                      } else {
                        pageOffset = _selectedIndex.toDouble();
                      }

                      return PageView.builder(
                        controller: _pageController,
                        onPageChanged: _onPageChanged,
                        itemCount: widget.screenshots.length,
                        physics: const BouncingScrollPhysics(),
                        clipBehavior: Clip.none,
                        itemBuilder: (context, index) {
                          final item = widget.screenshots[index];
                          final diff = index - pageOffset;
                          final isCurrent = index == _selectedIndex;

                          // 3D Perspective calculation
                          final scale = (1.0 - (diff.abs() * 0.16)).clamp(0.74, 1.0);
                          final opacity = (1.0 - (diff.abs() * 0.35)).clamp(0.35, 1.0);
                          final rotateY = (diff * -0.22).clamp(-0.42, 0.42);
                          final translateY = (diff.abs() * 16.0).clamp(0.0, 32.0);

                          final transform = Matrix4.identity()
                            ..setEntry(3, 2, 0.0016) // Perspective
                            ..translate(0.0, translateY)
                            ..scale(scale)
                            ..rotateY(rotateY);

                          return Center(
                            child: Transform(
                              transform: transform,
                              alignment: Alignment.center,
                              child: Opacity(
                                opacity: opacity,
                                child: GestureDetector(
                                  onTap: () {
                                    if (isCurrent) {
                                      _showFullScreenGallery(context, index);
                                    } else {
                                      _goToPage(index);
                                    }
                                  },
                                  child: MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: isMobile
                                        ? _buildPhoneMockup(item, isDark, isCurrent)
                                        : _buildDesktopMockup(item, isDark, isCurrent),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),

              // Side Floating Prev Button
              Positioned(
                left: 16,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: _prevImage,
                    borderRadius: BorderRadius.circular(AppRadius.full),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: (isDark ? Colors.black : Colors.white).withOpacity(0.85),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: (isDark ? Colors.white24 : Colors.black12),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 16,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: isDark ? Colors.white : Colors.black87,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),

              // Side Floating Next Button
              Positioned(
                right: 16,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: _nextImage,
                    borderRadius: BorderRadius.circular(AppRadius.full),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: (isDark ? Colors.black : Colors.white).withOpacity(0.85),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: (isDark ? Colors.white24 : Colors.black12),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 16,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: isDark ? Colors.white : Colors.black87,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),

              // Counter Badge (Top Right)
              Positioned(
                top: 14,
                right: 16,
                child: GestureDetector(
                  onTap: () => _showFullScreenGallery(context, _selectedIndex),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                      decoration: BoxDecoration(
                        color: (isDark ? const Color(0xFF161B22) : Colors.white).withOpacity(0.9),
                        borderRadius: BorderRadius.circular(AppRadius.full),
                        border: Border.all(
                          color: (isDark ? AppColors.darkPrimary : AppColors.lightPrimary).withOpacity(0.35),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.12),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: AppColors.accentGreen,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '${_selectedIndex + 1} / ${widget.screenshots.length}',
                            style: AppTypography.code(
                              color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                              fontSize: 12,
                            ).copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            Icons.fullscreen_rounded,
                            size: 16,
                            color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // Active Screenshot Detailed Card
        GlassCard(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      (isDark ? AppColors.darkPrimary : AppColors.lightPrimary).withOpacity(0.2),
                      (isDark ? AppColors.darkSecondary : AppColors.lightSecondary).withOpacity(0.1),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(AppRadius.sm),
                  border: Border.all(
                    color: (isDark ? AppColors.darkPrimary : AppColors.lightPrimary).withOpacity(0.3),
                  ),
                ),
                child: Icon(
                  isMobile ? Icons.smartphone_rounded : Icons.desktop_windows_rounded,
                  size: 24,
                  color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      child: Align(
                        key: ValueKey('title_${activeScreenshot.imageUrl}'),
                        alignment: widget.isArabic
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Text(
                          activeScreenshot.title(widget.isArabic),
                          style: widget.isArabic
                              ? AppTypography.headingSmall(
                                  color: isDark
                                      ? AppColors.darkTextPrimary
                                      : AppColors.lightTextPrimary,
                                  isArabic: true,
                                )
                              : AppTypography.code(
                                  color: isDark
                                      ? AppColors.darkTextPrimary
                                      : AppColors.lightTextPrimary,
                                  fontSize: 17,
                                ).copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      child: Align(
                        key: ValueKey('desc_${activeScreenshot.imageUrl}'),
                        alignment: widget.isArabic
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Text(
                          activeScreenshot.description(widget.isArabic),
                          style: AppTypography.bodyMedium(
                            color: isDark
                                ? AppColors.darkTextSecondary
                                : AppColors.lightTextSecondary,
                            isArabic: widget.isArabic,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              // Fullscreen Expand Button
              IconButton.filledTonal(
                onPressed: () => _showFullScreenGallery(context, _selectedIndex),
                icon: const Icon(Icons.zoom_in_rounded),
                tooltip: widget.isArabic ? 'تكبير الصورة' : 'Full Screen Preview',
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // Synchronized Thumbnails Strip with mouse drag
        SizedBox(
          height: isMobile ? 110 : 85,
          child: ScrollConfiguration(
            behavior: const MaterialScrollBehavior().copyWith(
              dragDevices: {
                PointerDeviceKind.touch,
                PointerDeviceKind.mouse,
                PointerDeviceKind.trackpad,
              },
            ),
            child: ListView.separated(
              controller: _thumbScrollController,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: widget.screenshots.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final item = widget.screenshots[index];
                final isSelected = index == _selectedIndex;

                return GestureDetector(
                  onTap: () => _goToPage(index),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      width: isMobile ? 65 : 120,
                      decoration: BoxDecoration(
                        color: isDark ? const Color(0xFF161B22) : const Color(0xFFE2E8F0),
                        borderRadius: BorderRadius.circular(AppRadius.md),
                        border: Border.all(
                          color: isSelected
                              ? (isDark
                                  ? AppColors.darkPrimary
                                  : AppColors.lightPrimary)
                              : (isDark
                                  ? AppColors.darkOutlineVariant.withOpacity(0.5)
                                  : AppColors.lightOutline),
                          width: isSelected ? 2.5 : 1,
                        ),
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color: (isDark
                                          ? AppColors.darkPrimary
                                          : AppColors.lightPrimary)
                                      .withOpacity(0.4),
                                  blurRadius: 12,
                                ),
                              ]
                            : null,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(AppRadius.md - 1),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: AppNetworkImage(
                                imageUrl: item.imageUrl,
                                fit: isMobile ? BoxFit.contain : BoxFit.cover,
                                fallbackIcon: isMobile
                                    ? Icons.phone_android_rounded
                                    : Icons.photo_outlined,
                              ),
                            ),
                            if (!isSelected)
                              Positioned.fill(
                                child: Container(
                                  color: Colors.black.withOpacity(0.4),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  // Realistic Smartphone Mockup Frame
  Widget _buildPhoneMockup(ProjectScreenshot item, bool isDark, bool isCurrent) {
    return Container(
      width: 250,
      height: 480,
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF0F141C),
        borderRadius: BorderRadius.circular(36),
        border: Border.all(
          color: isCurrent
              ? (isDark ? const Color(0xFF58A6FF) : const Color(0xFF0969DA))
              : const Color(0xFF30363D),
          width: isCurrent ? 3.5 : 2.0,
        ),
        boxShadow: [
          BoxShadow(
            color: isCurrent
                ? (isDark ? AppColors.darkPrimary : AppColors.lightPrimary).withOpacity(0.35)
                : Colors.black.withOpacity(0.3),
            blurRadius: isCurrent ? 30 : 16,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Inner Screen
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                color: Colors.black,
                child: AppNetworkImage(
                  imageUrl: item.imageUrl,
                  fit: BoxFit.contain,
                  fallbackIcon: Icons.phone_android_rounded,
                ),
              ),
            ),
          ),

          // Top Notch / Dynamic Island Hint
          Positioned(
            top: 12,
            child: Container(
              width: 70,
              height: 14,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white12, width: 0.8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 5,
                    height: 5,
                    decoration: const BoxDecoration(
                      color: Color(0xFF1E293B),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 4,
                    height: 4,
                    decoration: const BoxDecoration(
                      color: Color(0xFF334155),
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom Home Bar
          Positioned(
            bottom: 10,
            child: Container(
              width: 90,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.6),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Realistic Desktop Window Mockup Frame
  Widget _buildDesktopMockup(ProjectScreenshot item, bool isDark, bool isCurrent) {
    return Container(
      width: 580,
      height: 380,
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF0F141C),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(
          color: isCurrent
              ? (isDark ? const Color(0xFF58A6FF) : const Color(0xFF0969DA))
              : const Color(0xFF30363D),
          width: isCurrent ? 2.5 : 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: isCurrent
                ? (isDark ? AppColors.darkPrimary : AppColors.lightPrimary).withOpacity(0.3)
                : Colors.black.withOpacity(0.3),
            blurRadius: isCurrent ? 28 : 14,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          // Title Bar with 3 Window Dots
          Container(
            height: 30,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: const BoxDecoration(
              color: Color(0xFF161B22),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppRadius.lg - 1),
                topRight: Radius.circular(AppRadius.lg - 1),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFF5F56),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFBD2E),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Color(0xFF27C93F),
                    shape: BoxShape.circle,
                  ),
                ),
                const Spacer(),
                Text(
                  item.title(widget.isArabic),
                  style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          // Screen Image
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(AppRadius.lg - 1),
                bottomRight: Radius.circular(AppRadius.lg - 1),
              ),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: const Color(0xFF020408),
                child: AppNetworkImage(
                  imageUrl: item.imageUrl,
                  fit: BoxFit.contain,
                  fallbackIcon: Icons.laptop_chromebook_rounded,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showFullScreenGallery(BuildContext context, int initialIndex) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.94),
      builder: (dialogContext) {
        int currentDialogIndex = initialIndex;
        final dialogPageController = PageController(initialPage: initialIndex);

        return StatefulBuilder(
          builder: (context, setDialogState) {
            final activeItem = widget.screenshots[currentDialogIndex];

            return Dialog(
              backgroundColor: Colors.transparent,
              insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: ScrollConfiguration(
                            behavior: const MaterialScrollBehavior().copyWith(
                              dragDevices: {
                                PointerDeviceKind.touch,
                                PointerDeviceKind.mouse,
                                PointerDeviceKind.trackpad,
                              },
                            ),
                            child: PageView.builder(
                              controller: dialogPageController,
                              itemCount: widget.screenshots.length,
                              onPageChanged: (idx) {
                                setDialogState(() {
                                  currentDialogIndex = idx;
                                });
                                _goToPage(idx);
                              },
                              itemBuilder: (context, idx) {
                                final screenshot = widget.screenshots[idx];
                                return InteractiveViewer(
                                  minScale: 0.8,
                                  maxScale: 3.5,
                                  child: Center(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(AppRadius.lg),
                                      child: AppNetworkImage(
                                        imageUrl: screenshot.imageUrl,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 14),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(AppRadius.md),
                            border: Border.all(color: Colors.white24),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                activeItem.title(widget.isArabic),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                activeItem.description(widget.isArabic),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Close button
                  Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                      icon: const Icon(Icons.close_rounded, color: Colors.white, size: 30),
                      onPressed: () => Navigator.of(dialogContext).pop(),
                    ),
                  ),

                  // Left & Right Prev/Next buttons
                  Positioned(
                    left: 8,
                    top: 0,
                    bottom: 0,
                    child: Center(
                      child: IconButton(
                        icon: const Icon(Icons.chevron_left_rounded, color: Colors.white, size: 44),
                        onPressed: () {
                          if (currentDialogIndex > 0) {
                            dialogPageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    right: 8,
                    top: 0,
                    bottom: 0,
                    child: Center(
                      child: IconButton(
                        icon: const Icon(Icons.chevron_right_rounded, color: Colors.white, size: 44),
                        onPressed: () {
                          if (currentDialogIndex < widget.screenshots.length - 1) {
                            dialogPageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
