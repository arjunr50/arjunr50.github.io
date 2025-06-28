import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/core/constants/app_theme.dart';
import 'package:portfolio/core/constants/images_helper.dart';
import 'package:portfolio/core/utils/device_type.dart';
import 'package:portfolio/widgets/textview.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;
  final List<String> items;
  final String name;
  final ValueNotifier<int?> _hoveredIndex = ValueNotifier(null);
  final bool showMenuIcon;
  final VoidCallback? onMenuPressed;
  final DeviceType deviceType;
  final VoidCallback? onThemeToggle;

  CustomAppBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
    this.items = const ['Home', 'About', 'Skills', 'Projects', 'Contact'],
    this.name = '',
    this.showMenuIcon = false,
    this.onMenuPressed,
    required this.deviceType,
    this.onThemeToggle,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 6),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent.withAlpha(30),
            borderRadius: BorderRadius.circular(15),
          ),
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  onItemSelected(0);
                },
                child: SvgPicture.asset(
                  kLogo,
                  width: 40,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.deepPurple,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              Visibility(
                visible: deviceType != DeviceType.phone,
                replacement: Spacer(),
                child: Expanded(
                  flex: 2,
                  child: Center(
                    child: ValueListenableBuilder(
                        valueListenable: _hoveredIndex,
                        builder: (context, value, child) {
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(items.length, (index) {
                                final isSelected = selectedIndex == index;
                                final isHovered = _hoveredIndex.value == index;
                                Color color;
                                if (isSelected) {
                                  color = Colors.deepPurple;
                                } else if (isHovered) {
                                  color = Colors.deepPurpleAccent;
                                } else {
                                  color = Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.grey;
                                }
                                return MouseRegion(
                                  onEnter: (_) => _hoveredIndex.value = index,
                                  onExit: (_) => _hoveredIndex.value = null,
                                  child: InkWell(
                                    radius: 20,
                                    onTap: () => onItemSelected(index),
                                    borderRadius: BorderRadius.circular(12),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 18, vertical: 10),
                                      child: TextView(
                                        text: items[index],
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: color,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          );
                        }),
                  ),
                ),
              ),
              IconButton(
                icon: SvgPicture.asset(
                  Theme.of(context).brightness == Brightness.dark
                      ? kLightMode
                      : kDarkMode,
                  height: 28,
                  width: 28,
                ),
                onPressed: Provider.of<ThemeNotifier>(context, listen: false)
                    .toggleTheme,
              ),
              if (showMenuIcon)
                IconButton(
                  icon: SvgPicture.asset(
                    kMenu,
                    height: 30,
                    width: 30,
                    colorFilter: ColorFilter.mode(
                        Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.deepPurple,
                        BlendMode.srcIn),
                  ),
                  onPressed: onMenuPressed,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
