import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/device_type.dart';
import 'package:portfolio/views/home/domain/entities/portfolio_response.dart';
import 'package:portfolio/views/home/presentation/widgets/skill_card.dart';
import 'package:portfolio/core/shared/textview.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({
    super.key,
    required this.size,
    required this.aboutMeKey,
    required this.skillsKey,
    required this.deviceType,
    required this.data,
  });

  final Size size;
  final Key aboutMeKey;
  final Key skillsKey;
  final DeviceType deviceType;
  final PortfolioResponse data;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    double cardSize = deviceType == DeviceType.phone ? 100 : 150;
    return Container(
      key: aboutMeKey,
      width: size.width,
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.10,
        vertical: 30,
      ),
      child: Column(
        spacing: 30,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextView(
            text: "About Me",
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: theme.brightness == Brightness.dark
                ? Colors.white
                : Color(0xff145C9E),
          ),
          TextView(
            color: theme.colorScheme.onSurface,
            fontSize: 16,
            textAlign: TextAlign.justify,
            text: data.personal.about,
          ),
          TextView(
            globalKey: skillsKey,
            text: "Technical Skills",
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: theme.brightness == Brightness.dark
                ? Colors.white
                : Color(0xff145C9E),
          ),
          Center(
            child: Wrap(
              spacing: 12.0,
              runSpacing: 12.0,
              alignment: WrapAlignment.center,
              children: List.generate(data.technology.length, (i) =>
                  SkillCard(
                    imagePath: data.technology[i].icon,
                    skillName: data.technology[i].name,
                    baseSize: cardSize,
                  ),)
            ),
          ),
        ],
      ),
    );
  }
}
