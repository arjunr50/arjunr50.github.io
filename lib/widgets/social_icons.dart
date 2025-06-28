import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/core/constants/constant.dart';
import 'package:portfolio/widgets/container_icon.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIcons extends StatelessWidget {
  const SocialIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      direction: Axis.horizontal,
      children: [
        ContainerIcon(icon: FontAwesomeIcons.linkedinIn, onClick: () { _launchUrl(kLinkedInUrl); },),
        ContainerIcon(icon: FontAwesomeIcons.github, onClick: () { _launchUrl(kGithubUrl); },),
      ],
    );
  }
}

void _launchUrl(String url) async {
  final uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw 'Could not launch $url';
  }
}