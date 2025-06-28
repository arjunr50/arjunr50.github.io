import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/core/utils/device_type.dart';
import 'package:portfolio/widgets/image_container.dart';
import 'package:portfolio/widgets/title_text.dart';

import '../widgets/count_component.dart';

enum ProfileLayoutType { web, tab, mobile }

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    super.key,
    required this.size,
    required this.deviceType,
    this.layoutType = ProfileLayoutType.web,
  });

  final Size size;
  final DeviceType deviceType;
  final ProfileLayoutType layoutType;

  @override
  Widget build(BuildContext context) {
    switch (layoutType) {
      case ProfileLayoutType.mobile:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ImageContainer(widthPercent: 0.4),
            TitleText(
              size: size,
              direction: Axis.vertical,
              widthPercent: 0.65,
              deviceType: deviceType,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CountComponent(
                  size: size,
                  count: '4+',
                  text: ' Projects',
                  text2: "Completed",
                ),
                Divider(
                  color: AppColors.palePink,
                  indent: size.width * 0.25,
                  endIndent: size.width * 0.25,
                ),
                CountComponent(
                  size: size,
                  count: '3',
                  text: ' Years of',
                  text2: "Experience",
                ),
              ],
            ),
          ],
        );
      case ProfileLayoutType.tab:
        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ImageContainer(widthPercent: 0.3),
                SizedBox(height: 20),
                TitleText(
                  size: size,
                  direction: Axis.vertical,
                  widthPercent: 0.75,
                  deviceType: deviceType,
                ),
                SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CountComponent(
                      size: size,
                      count: '4+',
                      text: ' Projects',
                      text2: "Completed",
                    ),
                    SizedBox(
                      width: size.width * 0.5,
                      child: Divider(
                        color: AppColors.palePink,
                        indent: size.width * 0.1,
                        endIndent: size.width * 0.1,
                      ),
                    ),
                    CountComponent(
                      size: size,
                      count: '3',
                      text: ' Years of',
                      text2: "Experience",
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      case ProfileLayoutType.web:
      return Container(
          margin: EdgeInsets.symmetric(
              horizontal: size.width * 0.15, vertical: size.height * 0.2),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TitleText(
                    size: size,
                    direction: Axis.horizontal,
                    deviceType: deviceType,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [ImageContainer()],
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CountComponent(
                    size: size,
                    count: '4+',
                    text: ' Projects',
                    text2: "Completed",
                  ),
                  CountComponent(
                    size: size,
                    count: '3',
                    text: ' Years of',
                    text2: "Experience",
                  ),
                ],
              ),
            ],
          ),
        );
    }
  }
}