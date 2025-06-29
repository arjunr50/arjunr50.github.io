import 'package:flutter/material.dart';
import 'package:portfolio/widgets/textview.dart';

class CountComponent extends StatelessWidget {
  const CountComponent(
      {super.key,
      required this.size,
      required this.count,
      required this.text,
      this.text2});

  final Size size;
  final String count;
  final String text;
  final String? text2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextView(
          text: count,
          color: Theme.of(context).colorScheme.onSurface,
          fontSize: 40,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(
          width: 5,
        ),
        TextView(
          text: "$text\n $text2",
          color: Theme.of(context).colorScheme.onSurface,
        )
      ],
    );
  }
}
