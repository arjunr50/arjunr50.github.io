import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/widgets/textview.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Color? iconColor;
  final Color? borderColor;
  final double? height;
  final double? width;
  final double? radius;
  final String? icon;
  final VoidCallback? onClick;
  final FontWeight? fontWeight;

  const CommonButton({
    super.key,
    required this.text,
    this.textColor,
    this.borderColor,
    this.height,
    this.width,
    this.radius,
    this.icon,
    this.onClick,
    this.fontWeight,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          hoverColor: AppColors.royalPurple.withAlpha((0.1 * 255).toInt()),
          highlightColor: AppColors.royalPurple.withAlpha((0.1 * 255).toInt()),
          splashColor: AppColors.royalPurple.withAlpha((0.2 * 255).toInt()),
          onTap: onClick,
          borderRadius: BorderRadius.circular(radius ?? 20),
          child: Container(
            height: height ?? 47,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius ?? 20),
              border: Border.all(color: borderColor ?? AppColors.royalPurple),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextView(
                  text: text,
                  color: textColor ?? AppColors.royalPurple,
                  fontSize: 15,
                  fontWeight: fontWeight ?? FontWeight.w400,
                ),
                if (icon != null) ...[
                  const SizedBox(width: 12),
                  SvgPicture.asset(
                    icon!,
                    colorFilter: ColorFilter.mode(
                      iconColor ?? AppColors.royalPurple,
                      BlendMode.srcIn,
                    ),
                    height: 22,
                    width: 22,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
