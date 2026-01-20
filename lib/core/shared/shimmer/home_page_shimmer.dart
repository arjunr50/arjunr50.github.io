import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/styles.dart';
import 'package:portfolio/core/utils/device_type.dart';
import 'package:shimmer/shimmer.dart';

class HomePageShimmer extends StatelessWidget {
  const HomePageShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    final deviceType = _getDeviceType(size.width);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: isDark ? GradientStyles.darkHeroGradient : null,
          color: isDark ? null : const Color(0xffF9F8F8),
        ),
        child: Shimmer.fromColors(
          baseColor: isDark ? Colors.grey[800]! : Colors.grey[300]!,
          highlightColor: isDark ? Colors.grey[700]! : Colors.grey[200]!,
          period: const Duration(seconds: 2),
          child: _buildShimmerContent(context, size, deviceType),
        ),
      ),
    );
  }

  Widget _buildShimmerContent(
    BuildContext context,
    Size size,
    DeviceType deviceType,
  ) {
    switch (deviceType) {
      case DeviceType.web:
        return _buildWebShimmer(size);
      case DeviceType.tab:
        return _buildTabShimmer(size);
      case DeviceType.phone:
        return _buildMobileShimmer(size);
    }
  }

  Widget _buildWebShimmer(Size size) {
    final isWeb = size.width > 1024;

    final dimension = (size.width * (0.22))

        .clamp(100.0, isWeb ? 250.0 : 250.0);
    return CustomScrollView(
      slivers: [
        // AppBar shimmer for web
        _buildAppBarShimmer(size, DeviceType.web),

        // Profile Section (web layout - horizontal)
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: size.width * 0.10,
              vertical: size.height * 0.2,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Title section (left side)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 300,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: 250,
                        height: 25,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: 400,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        spacing: 20,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [_buildCountShimmer(), _buildCountShimmer()],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 40),
                // Image container (right side)
                Expanded(
                  child: Container(
                    width: dimension,
                    height: dimension,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // About Me Section
        _buildAboutMeShimmer(size, DeviceType.web),

        // Projects Section
        _buildProjectsShimmer(size, DeviceType.web),

        // Contact Section
        _buildContactShimmer(size, DeviceType.web),

        // Footer
        _buildFooterShimmer(),
      ],
    );
  }

  Widget _buildTabShimmer(Size size) {
    return CustomScrollView(
      slivers: [
        // AppBar shimmer for tab
        _buildAppBarShimmer(size, DeviceType.tab),

        // Profile Section (tab layout - vertical)
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: size.height * 0.12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Profile image
                Container(
                  width: size.width * 0.3,
                  height: size.width * 0.3,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(size.width * 0.15),
                  ),
                ),
                const SizedBox(height: 30),
                // Name and title
                Container(
                  width: size.width * 0.6,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  width: size.width * 0.7,
                  height: 25,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(height: 30),
                // Count components (vertical)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildCountShimmer(),
                    SizedBox(
                      width: size.width * 0.5,
                      child: const Divider(
                        color: Colors.white,
                        indent: 20,
                        endIndent: 20,
                      ),
                    ),
                    _buildCountShimmer(),
                  ],
                ),
              ],
            ),
          ),
        ),

        // About Me Section
        _buildAboutMeShimmer(size, DeviceType.tab),

        // Projects Section
        _buildProjectsShimmer(size, DeviceType.tab),

        // Contact Section
        _buildContactShimmer(size, DeviceType.tab),

        // Footer
        _buildFooterShimmer(),
      ],
    );
  }

  Widget _buildMobileShimmer(Size size) {
    return CustomScrollView(
      slivers: [
        // AppBar shimmer for mobile (with menu icon)
        _buildAppBarShimmer(size, DeviceType.phone),

        // Profile Section (mobile layout - centered)
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: size.height * 0.09),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Profile image
                Container(
                  width: size.width * 0.4,
                  height: size.width * 0.4,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(size.width * 0.2),
                  ),
                ),
                const SizedBox(height: 25),
                // Name
                Container(
                  width: size.width * 0.5,
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(height: 15),
                // Title
                Container(
                  width: size.width * 0.65,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(height: 30),
                // Count components (vertical for mobile)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildCountShimmer(),
                    Divider(
                      color: Colors.white,
                      indent: size.width * 0.25,
                      endIndent: size.width * 0.25,
                    ),
                    _buildCountShimmer(),
                  ],
                ),
              ],
            ),
          ),
        ),

        // About Me Section
        _buildAboutMeShimmer(size, DeviceType.phone),

        // Projects Section
        _buildProjectsShimmer(size, DeviceType.phone),

        // Contact Section
        _buildContactShimmer(size, DeviceType.phone),

        // Footer
        _buildFooterShimmer(),
      ],
    );
  }

  Widget _buildAppBarShimmer(Size size, DeviceType deviceType) {
    final isPhone = deviceType == DeviceType.phone;
    final leftRightMargin = isPhone ? size.width * 0.03 : 32.0;
    final topMargin = 30.0;

    return SliverAppBar(
      expandedHeight: 90,
      toolbarHeight: 90,
      pinned: true,
      floating: false,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      flexibleSpace: Container(
        margin: EdgeInsets.only(
          left: leftRightMargin,
          right: leftRightMargin,
          top: topMargin,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(30),
              borderRadius: BorderRadius.circular(15),
            ),
            height: 80,
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              children: [
                // Logo
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                if (!isPhone) ...[
                  const Spacer(flex: 2),
                  // Menu items
                  Row(
                    children: List.generate(
                      5,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        width: 60,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                ],
                Spacer(flex: isPhone ? 1 : 1),
                // Theme toggle
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                if (isPhone) ...[
                  const SizedBox(width: 16),
                  // Menu icon for mobile
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAboutMeShimmer(Size size, DeviceType deviceType) {
    final isPhone = deviceType == DeviceType.phone;
    final cardSize = isPhone
        ? 100.0
        : deviceType == DeviceType.tab
        ? 120.0
        : 150.0;
    final horizontalPadding = isPhone ? size.width * 0.05 : size.width * 0.10;

    return SliverToBoxAdapter(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // "About Me" title
            Container(
              width: 150,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(height: 20),
            // About text
            Container(
              width: double.infinity,
              height: isPhone ? 100 : 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(height: 40),
            // "Technical Skills" title
            Container(
              width: 200,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(height: 30),
            // Skills grid
            Wrap(
              spacing: 12.0,
              runSpacing: 12.0,
              alignment: WrapAlignment.center,
              children: List.generate(
                9,
                (index) => Container(
                  width: cardSize,
                  height: cardSize,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectsShimmer(Size size, DeviceType deviceType) {
    final isPhone = deviceType == DeviceType.phone;
    final horizontalPadding = isPhone ? size.width * 0.05 : size.width * 0.10;
    final projectWidth = isPhone ? size.width * 0.9 : 350.0;
    final projectHeight = isPhone ? 200.0 : 250.0;
    final projectCount = isPhone ? 3 : 6;

    return SliverToBoxAdapter(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // "Featured Projects" title
            Container(
              width: 250,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(height: 30),
            // Projects grid
            Wrap(
              spacing: isPhone ? 15 : 25,
              runSpacing: isPhone ? 15 : 25,
              alignment: WrapAlignment.center,
              children: List.generate(
                projectCount,
                (index) => Container(
                  width: projectWidth,
                  height: projectHeight,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactShimmer(Size size, DeviceType deviceType) {
    final isPhone = deviceType == DeviceType.phone;
    final horizontalPadding = isPhone ? size.width * 0.05 : size.width * 0.10;

    return SliverToBoxAdapter(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // "Contact" title
            Container(
              width: 120,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(height: 20),
            // Contact text
            Container(
              width: double.infinity,
              height: isPhone ? 40 : 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(height: 30),
            // Contact info cards
            Wrap(
              direction: isPhone ? Axis.vertical : Axis.vertical,
              spacing: 15,
              children: List.generate(
                3,
                (index) => Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 16,
                      ),
                      width: isPhone ? 150 : 200,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            // Social icons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                isPhone ? 4 : 5,
                (index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: isPhone ? 8 : 10),
                  width: isPhone ? 40 : 50,
                  height: isPhone ? 40 : 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooterShimmer() {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: Colors.white.withAlpha(10)),
        child: Center(
          child: Container(
            width: 200,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCountShimmer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 60,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 80,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }

  DeviceType _getDeviceType(double width) {
    if (width >= 1024) return DeviceType.web;
    if (width >= 600) return DeviceType.tab;
    return DeviceType.phone;
  }
}
