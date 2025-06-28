import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/core/constants/app_colors.dart';

class ContainerIcon extends StatelessWidget {
  const ContainerIcon({super.key, required this.icon, required this.onClick});
  final IconData icon;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.royalPurple)),
        child: Center(
          child: IconButton(
              onPressed: onClick,
              hoverColor: AppColors.palePink,
              icon: FaIcon(
                icon,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white:Color(0xff145C9E),
                size: 20,
              )),
        ));
  }
}
