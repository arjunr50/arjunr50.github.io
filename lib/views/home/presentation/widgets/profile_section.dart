import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/core/shared/title_text.dart';
import 'package:portfolio/core/utils/device_type.dart';
import 'package:portfolio/views/home/domain/entities/portfolio_response.dart';
import 'package:portfolio/views/home/presentation/widgets/image_container.dart';

import '../widgets/count_component.dart';

enum ProfileLayoutType { web, tab, mobile }

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    super.key,
    required this.size,
    required this.deviceType,
    this.layoutType = ProfileLayoutType.web,
    required this.data,
  });

  final Size size;
  final DeviceType deviceType;
  final ProfileLayoutType layoutType;
  final PortfolioResponse data;

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
              data: data,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CountComponent(
                  size: size,
                  count: '${data.personal.noOfProjects}+',
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
                  count: '${data.personal.exp}',
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
                  data: data,
                ),
                SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CountComponent(
                      size: size,
                      count: '${data.personal.noOfProjects}+',
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
                      count: '${data.personal.exp}',
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
            horizontal: size.width * 0.10,
            vertical: size.height * 0.2,
          ),
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
                    data: data,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [ImageContainer()],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CountComponent(
                    size: size,
                    count: '${data.personal.noOfProjects}+',
                    text: ' Projects',
                    text2: "Completed",
                  ),
                  CountComponent(
                    size: size,
                    count: '${data.personal.exp}',
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
