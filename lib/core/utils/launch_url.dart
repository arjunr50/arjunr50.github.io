import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/core/constants/menu.dart';
import 'package:portfolio/widgets/textview.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openUrl(String link) async {
  final Uri url = Uri.parse(link);
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    showSnackBar("Could not launch : $url", isError: true);
  }
}

void showSnackBar(String text, {bool isError = false}) {
  snackBarKey.currentState?.showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: isError ? Colors.red : Colors.green,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      content: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FaIcon(
            isError
                ? FontAwesomeIcons.triangleExclamation
                : FontAwesomeIcons.check,
            color: Colors.white,
          ),
          TextView(
            text: text,
            left: 20,
            fontWeight: FontWeight.bold,
          ),
        ],
      )));
}
