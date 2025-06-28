import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  const TextView(
      {super.key,
      required this.text,
      this.fontSize = 16,
      this.fontWeight = FontWeight.w400,
      this.color = Colors.black,
      this.left = 0,
      this.right = 0,
      this.top = 0,
      this.bottom = 0,
      this.fontFamily,
      this.textAlign,
      this.maxLines,
      this.overflow,
      this.globalKey,
      this.letterSpacing});

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final double left;
  final double right;
  final double top;
  final double bottom;
  final String? fontFamily;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final Key? globalKey;
  final double? letterSpacing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: left, top: top, right: right, bottom: bottom),
      child: Text(
        key: globalKey,
        text,
        textAlign: textAlign,
        style: TextStyle(
            letterSpacing: letterSpacing,
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontFamily: fontFamily),
        maxLines: maxLines,
        overflow: overflow,
      ),
    );
  }
}
