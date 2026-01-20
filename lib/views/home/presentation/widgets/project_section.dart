import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/device_type.dart';
import 'package:portfolio/views/home/domain/entities/portfolio_response.dart';
import 'package:portfolio/views/home/presentation/widgets/project_card.dart';
import 'package:portfolio/core/shared/textview.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({
    super.key,
    required this.size,
    required this.deviceType,
    this.margin,
    this.height, required this.data,
  });

  final Size size;
  final DeviceType deviceType;
  final EdgeInsetsGeometry? margin;
  final double? height;
  final PortfolioResponse data;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      padding:
          EdgeInsets.symmetric(horizontal: size.width * 0.10, vertical: 30),
      child: Column(
          spacing: 30,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: TextView(
                text: "Featured Projects",
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Color(0xff145C9E),
              ),
            ),
            Wrap(
              spacing: 25,
              runSpacing: 25,
              alignment: WrapAlignment.center,
              children: data.projects.reversed
                  .map((project) => ProjectCard(
                        data: project,
                      ))
                  .toList(),
            )
          ]),
    );
  }
}