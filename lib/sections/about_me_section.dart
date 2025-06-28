import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/images_helper.dart';
import 'package:portfolio/core/utils/device_type.dart';
import 'package:portfolio/widgets/skill_card.dart';
import 'package:portfolio/widgets/textview.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection(
      {super.key,
      required this.size,
      required this.aboutMeKey,
      required this.skillsKey,
      required this.deviceType});

  final Size size;
  final Key aboutMeKey;
  final Key skillsKey;
  final DeviceType deviceType;

  @override
  Widget build(BuildContext context) {
    double cardSize = deviceType == DeviceType.phone ? 100 : 150;
    return Container(
      key: aboutMeKey,
      width: size.width,
      padding:
          EdgeInsets.symmetric(horizontal: size.width * 0.13, vertical: 30),
      child: Column(
        spacing: 30,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextView(
            text: "About Me",
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Color(0xff145C9E),
          ),
          TextView(
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 16,
              textAlign: TextAlign.justify,
              text:
                  """I’m a passionate Flutter Developer with over 2.6 years of hands-on experience in building high-quality mobile applications. I specialize in Dart and C#, and have consistently delivered robust, scalable, and efficient solutions across both Android and iOS platforms. My expertise lies in developing cross-platform applications with a strong focus on performance, clean architecture, and user-centric design."""),
          TextView(
            globalKey: skillsKey,
            text: "Technical Skills",
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Color(0xff145C9E),
          ),
          Center(
            child: Wrap(
              spacing: 12.0,
              runSpacing: 12.0,
              alignment: WrapAlignment.center,
              children: <Widget>[
                SkillCard(
                  imagePath: kFlutter,
                  skillName: 'Flutter',
                  baseSize: cardSize,
                ),
                SkillCard(
                  imagePath: kDart,
                  skillName: 'Dart',
                  baseSize: cardSize,
                ),
                SkillCard(
                  imagePath: kPython,
                  skillName: 'Python',
                  baseSize: cardSize,
                ),
                SkillCard(
                  imagePath: kSql,
                  skillName: 'SQL',
                  baseSize: cardSize,
                ),
                SkillCard(
                  imagePath: kCsharp,
                  skillName: 'C#',
                  baseSize: cardSize,
                ),
                SkillCard(
                  imagePath: kFirebase,
                  skillName: 'Firebase',
                  baseSize: cardSize,
                ),
                SkillCard(
                  imagePath: kGit,
                  skillName: 'Git',
                  baseSize: cardSize,
                ),
                SkillCard(
                  imagePath: kGithub,
                  skillName: 'GitHub',
                  baseSize: cardSize,
                ),
                SkillCard(
                  imagePath: kPostman,
                  skillName: 'Postman',
                  baseSize: cardSize,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
