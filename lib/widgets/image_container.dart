import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/core/constants/images_helper.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({super.key, this.widthPercent});

  final double? widthPercent;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isWeb = size.width > 1024;

    final dimension = (size.width * (widthPercent ?? 0.22))
        .clamp(100.0, isWeb ? 250.0 : 250.0);

    return Container(
      height: dimension,
      width: dimension,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(kProfile),
        ),
        border: Border.all(color: AppColors.royalPurple, width: 1.2),
      ),
    );
  }
}
