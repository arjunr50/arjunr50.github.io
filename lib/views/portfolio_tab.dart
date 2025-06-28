import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/styles.dart';
import 'package:portfolio/core/utils/device_type.dart';
import 'package:portfolio/sections/about_me_section.dart';
import 'package:portfolio/sections/contact_section.dart';
import 'package:portfolio/sections/footer_section.dart';
import 'package:portfolio/sections/profile_section.dart';
import 'package:portfolio/sections/project_section.dart';
import 'package:portfolio/widgets/appbar.dart';

class PortfolioTab extends StatelessWidget {
  const PortfolioTab(
      {super.key,
      required this.deviceType,
      required this.sectionKeys,
      required this.onSectionSelected,
      required this.selectedIndex,
      required this.hasScrolled,
      required this.scrollController});

  final DeviceType deviceType;
  final List<GlobalKey> sectionKeys;
  final void Function(int) onSectionSelected;
  final ValueNotifier<int> selectedIndex;
  final ValueNotifier<bool> hasScrolled;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ValueListenableBuilder(
        valueListenable: selectedIndex,
        builder: (context, value, child) {
          return Scaffold(
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: Theme.of(context).brightness == Brightness.dark
                    ? GradientStyles.darkHeroGradient
                    : null,
                color: Theme.of(context).brightness == Brightness.dark
                    ? null
                    : Color(0xffF9F8F8),
              ),
              child: NotificationListener<ScrollNotification>(
                onNotification: (scroll) {
                  hasScrolled.value = scroll.metrics.pixels > 0;
                  return false;
                },
                child: ValueListenableBuilder(
                    valueListenable: hasScrolled,
                    builder: (context, hasScrolled, _) {
                      return CustomScrollView(
                        controller: scrollController,
                        slivers: [
                          SliverAppBar(
                            pinned: true,
                            floating: false,
                            forceElevated: hasScrolled,
                            backgroundColor: Colors.transparent,
                            surfaceTintColor: Colors.transparent,
                            flexibleSpace: Material(
                              color: Colors.transparent,
                              child: Container(
                                margin: EdgeInsets.only(
                                  left: size.width * 0.03,
                                  right: size.width * 0.03,
                                  top: 30,
                                ),
                                child: CustomAppBar(
                                  name: 'Arjun R',
                                  selectedIndex: selectedIndex.value,
                                  onItemSelected: (int index) =>
                                      onSectionSelected(index),
                                  deviceType: deviceType,
                                ),
                              ),
                            ),
                            expandedHeight: 90,
                            toolbarHeight: 90,
                            automaticallyImplyLeading: false,
                          ),
                          SliverToBoxAdapter(
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: size.height * 0.12),
                              child: ProfileSection(
                                key: sectionKeys[0],
                                size: size,
                                deviceType: deviceType,
                                layoutType: ProfileLayoutType.mobile,
                              ),
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: AboutMeSection(
                              aboutMeKey: sectionKeys[1],
                              skillsKey: sectionKeys[2],
                              size: size,
                              deviceType: deviceType,
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: ProjectSection(
                              key: sectionKeys[3],
                              size: size,
                              deviceType: deviceType,
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: ContactSection(
                              key: sectionKeys[4],
                              size: size,
                              deviceType: deviceType,
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: PortfolioFooter(),
                          ),
                        ],
                      );
                    }),
              ),
            ),
          );
        });
  }
}
