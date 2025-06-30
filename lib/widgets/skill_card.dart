import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/widgets/textview.dart';

class SkillCard extends StatelessWidget {
  final String imagePath;
  final String skillName;
  final Color shadowColor;
  final double elevation;
  final double hoverElevation;
  final double baseSize;

  SkillCard({
    super.key,
    required this.imagePath,
    required this.skillName,
    this.shadowColor = Colors.black54,
    this.elevation = 4.0,
    this.hoverElevation = 12.0,
    this.baseSize = 150,
  });

  final ValueNotifier<bool> _isHovering = ValueNotifier(false);

  static const double _hoverScale = 1.08;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onEnter: (_) => _isHovering.value = true,
        onExit: (_) => _isHovering.value = false,
        child: ValueListenableBuilder<bool>(
            valueListenable: _isHovering,
            builder: (context, isHovering, child) {
              return AnimatedScale(
                scale: _isHovering.value ? _hoverScale : 1.0,
                duration: const Duration(milliseconds: 180),
                curve: Curves.easeOut,
                child: SizedBox(
                  width: baseSize,
                  height: baseSize,
                  child: Card(
                    elevation: _isHovering.value ? hoverElevation : elevation,
                    shadowColor: shadowColor.withValues(
                        alpha: _isHovering.value ? 0.7 : 0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Center(
                              child: SvgPicture.asset(
                                imagePath,
                                height: 60,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextView(
                            text: skillName,
                            textAlign: TextAlign.center,
                            fontSize: baseSize * 0.10,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).hintColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}
