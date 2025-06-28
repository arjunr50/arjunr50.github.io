import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/styles.dart';
import 'package:portfolio/core/utils/device_type.dart';
import 'package:portfolio/sections/about_me_section.dart';
import 'package:portfolio/sections/contact_section.dart';
import 'package:portfolio/sections/footer_section.dart';
import 'package:portfolio/sections/profile_section.dart';
import 'package:portfolio/sections/project_section.dart';
import 'package:portfolio/widgets/appbar.dart';
import 'package:portfolio/widgets/textview.dart';

class PortfolioMobile extends StatelessWidget {
  PortfolioMobile({
    super.key,
    required this.deviceType,
    required this.sectionKeys,
    required this.onSectionSelected,
    required this.selectedIndex,
    required this.hasScrolled,
    required this.scrollController,
  });

  final DeviceType deviceType;
  final List<GlobalKey> sectionKeys;
  final void Function(int) onSectionSelected;
  final ValueNotifier<int> selectedIndex;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final ValueNotifier<bool> hasScrolled;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    return Scaffold(
      key: scaffoldKey,
      body: Container(
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
                            showMenuIcon: true,
                            onMenuPressed: () => showSectionPickerDialog(
                                context, selectedIndex.value, (index) {
                              final contextSection =
                                  sectionKeys[index].currentContext;
                              if (contextSection != null) {
                                Scrollable.ensureVisible(
                                  contextSection,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                );
                                onSectionSelected(index);
                              }
                            }, size),
                            deviceType: deviceType,
                            selectedIndex: selectedIndex.value,
                            onItemSelected: (i) => onSectionSelected(i),
                          ),
                        ),
                      ),
                      expandedHeight: 90,
                      toolbarHeight: 90,
                      automaticallyImplyLeading: false,
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(vertical: size.height * 0.09),
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
  }
}

void showSectionPickerDialog(BuildContext context, int selectedIndex,
    Function(int) onSectionSelected, Size size) {
  showDialog(
    context: context,
    builder: (context) {
      int currentIndex = selectedIndex;
      final items = ['Home', 'About', 'Skills', 'Projects', 'Contact'];
      return StatefulBuilder(
        builder: (context, _) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 2),
            child: AlertDialog(
              backgroundColor: Colors.transparent,
              elevation: 10,
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: IconButton(
                          icon: Icon(Icons.close, color: Colors.white),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 300,
                    width: 260,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final isSelected = currentIndex == index;
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                            onSectionSelected(index);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.transparent.withValues(alpha: 0.3),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: TextView(
                                text: items[index],
                                fontSize: isSelected ? 22 : 20,
                                fontWeight: isSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                color: isSelected
                                    ? Theme.of(context).highlightColor
                                    : Colors.white,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
