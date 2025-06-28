import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/images_helper.dart';
import 'package:portfolio/core/utils/device_type.dart';
import 'package:portfolio/widgets/project_card.dart';
import 'package:portfolio/widgets/textview.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({
    super.key,
    required this.size,
    required this.deviceType,
    this.margin,
    this.height,
  });

  final Size size;
  final DeviceType deviceType;
  final EdgeInsetsGeometry? margin;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.1, vertical: 30),
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
              children: projectsData
                  .map((project) => ProjectCard(
                        data: project,
                      ))
                  .toList(),
            )
          ]),
    );
  }
}

final List<Map<String, String>> projectsData = [
  {
    'imagePath': kDAlert,
    'app': 'Mobile App',
    'tech_stack': 'Flutter, TensorFlow Lite',
    'title': 'D-Alert',
    'description':
        'D-Alert uses a tflite model extracted from training using MRL dataset and custom dataset to do its tasks such as detecting level of alertness/drowsiness from the live video captured from mobile camera',
    'link': 'https://github.com/arjunr50/D-Alert',
  },
  {
    'imagePath': kEnstva,
    'app': 'Command line',
    'tech_stack': 'Python',
    'title': 'Enstva',
    'description':
        'ENSTVA is a web-site sub-path enumerator. It can be used to with websites involving alphanumeric combinations as sub-paths. It records the URL\'s which does\'nt involves redirecton',
    'link': 'https://github.com/arjunr50/Project-ENSTVA',
  },
  {
    'imagePath': kEventally,
    'app': 'Web',
    'tech_stack': 'MEAN',
    'title': 'Event_Ally',
    'description':
        'A Event Listing web app for college students, so that they won\'t miss out upcoming important events like workshops ,tech talks etc..',
    'link': 'https://github.com/arjunr50/Event_Ally',
  },
  {
    'imagePath': kBluecollerio,
    'app': 'Web',
    'tech_stack': 'HTML, CSS, JavaScript',
    'title': 'Bluecollerio',
    'description':
        'The proposed model is a web site for locating handyman services within a locality to help in streamlining this process.',
    'link': 'https://github.com/arjunr50/Handyman-Job-Portel-Website',
  },
  {
    'imagePath': kKerala,
    'app': 'Web',
    'tech_stack': 'HTML, CSS, JavaScript',
    'title': 'Kerala-Tourism',
    'description':
        'Static website for Kerala Tourism, showcasing the beauty and culture of Kerala.',
    'link': 'https://github.com/arjunr50/Kerala-Tourism',
  },
];
