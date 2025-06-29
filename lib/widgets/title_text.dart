import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/core/constants/images_helper.dart';
import 'package:portfolio/core/utils/device_type.dart';
import 'package:portfolio/widgets/social_icons.dart';
import 'package:portfolio/widgets/textview.dart';

class TitleText extends StatelessWidget {
  const TitleText(
      {super.key,
      required this.size,
      required this.direction,
      this.widthPercent,
      required this.deviceType});

  final Size size;
  final Axis direction;
  final double? widthPercent;
  final DeviceType deviceType;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: deviceType == DeviceType.phone
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextView(
              text: "Hello, I am",
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white:Color(0xff145C9E),
            ),
            Wrap(

              children: [
                TextView(
                  text: "Arjun R ",
                  fontSize: deviceType == DeviceType.phone ? 30 : 40,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white:Color(0xff145C9E),
                ),
                SvgPicture.asset(kHi,width: deviceType == DeviceType.phone ? 30 : 40,height: deviceType == DeviceType.phone ? 40 : 50,)
              ],
            ),
            ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [AppColors.royalPurple, AppColors.palePink],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(
                  Rect.fromLTWH(0.0, 0.0, bounds.width, bounds.height)),
              blendMode: BlendMode.srcIn,
              child: SizedBox(
                child: AnimatedTextKit(
                  animatedTexts: [
                    "Flutter Developer",
                    "Software Engineer",
                    "Tech Enthusiast",
                  ]
                      .map((text) => TypewriterAnimatedText(
                            text,
                            textStyle: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors
                                  .white,
                            ),
                            speed: const Duration(milliseconds: 150),
                          ))
                      .toList(),
                  repeatForever: true,
                  pause: const Duration(milliseconds: 200),
                  displayFullTextOnTap: false,
                  stopPauseOnTap: false,
                ),
              ),
            ),
            SizedBox(
              width: (size.width * (widthPercent ?? 0.5)),
              child: TextView(
                text:
                    "Building scalable Flutter apps with clean architecture and smooth performance.",
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white:Color(0xff145C9E),
                fontSize: 16,
                textAlign: TextAlign.justify,
                top: 10,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SocialIcons()
          ],
        ),
      ],
    );
  }
}
