import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/images_helper.dart';
import 'package:portfolio/widgets/common_button.dart';
import 'package:portfolio/widgets/social_icons.dart';

class DownloadComponent extends StatelessWidget {
  const DownloadComponent({super.key, required this.size, required this.direction});
  final Size size;
  final Axis direction;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.5,
      child: Column(
        crossAxisAlignment: direction == Axis.vertical ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 10,
            crossAxisAlignment: WrapCrossAlignment.center,
            direction: direction,
            children: [
              CommonButton(
                textColor : Colors.white,
                iconColor: Colors.white,
                text: 'Download Resume',
                icon: kDownload,
                fontWeight: FontWeight.w600,
                onClick: () {},
              ),
              SocialIcons(),
            ],
          ),
        ],
      ),
    );
  }
}
