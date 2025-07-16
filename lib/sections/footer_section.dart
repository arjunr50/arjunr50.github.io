import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/core/constants/images_helper.dart';
import 'package:portfolio/widgets/textview.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioFooter extends StatelessWidget {
  const PortfolioFooter({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.canvasColor,
      ),
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextView(
                text: 'Made with ', fontSize: 14, color: theme.disabledColor),
            SvgPicture.asset(
              kHeart,
              width: 18,
              height: 18,
            ),
            TextView(
                text: ' in Flutter', fontSize: 14, color: theme.disabledColor),
          ],
        ),
      ),
    );
  }
}
