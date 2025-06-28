import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/launch_url.dart';
import 'package:portfolio/widgets/textview.dart';

class ProjectCard extends StatelessWidget {
  ProjectCard({
    super.key,
    required this.data,
    this.elevation = 4.0,
    this.hoverElevation = 12.0,
  });

  final Map<String, String> data;
  final ValueNotifier<bool> isHovered = ValueNotifier<bool>(false);
  final double elevation;
  final double hoverElevation;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => isHovered.value = true,
      onExit: (_) => isHovered.value = false,
      child: ValueListenableBuilder<bool>(
          valueListenable: isHovered,
          builder: (context, hovered, child) {
            return AnimatedScale(
              scale: isHovered.value ? 1.03 : 1.0,
              duration: const Duration(milliseconds: 180),
              curve: Curves.easeOut,
              child: InkWell(
                onTap: () => openUrl(data['link']!),
                child: Material(
                  elevation: isHovered.value ? hoverElevation : elevation,
                  shadowColor: Colors.black.withValues(
                    alpha: isHovered.value ? 0.7 : 0.5,
                  ),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.transparent,
                  child: Container(
                    width: 350,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withValues(alpha: 0.5)),
                    child: Column(
                      children: [
                        Stack(children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15)),
                            child: Image.asset(data['imagePath']!,
                                height: 180,
                                fit: BoxFit.fitWidth,
                                width: double.infinity),
                          ),
                          Positioned(
                            top: 10,
                            left: 5,
                            child: Chip(
                                padding: EdgeInsets.zero,
                                side: BorderSide.none,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: BorderSide.none,
                                ),
                                label: TextView(
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                  text: data['app']!,
                                  fontSize: 12,
                                ),
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withValues(alpha: 0.5)),
                          ),
                        ]),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            spacing: 10,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: TextView(
                                      text: data['title']!,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Wrap(
                                      spacing: 8,
                                      runSpacing: 8,
                                      alignment: WrapAlignment.end,
                                      children: data['tech_stack']!
                                          .split(',')
                                          .map((tech) => Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 4,
                                                        horizontal: 5),
                                                decoration: BoxDecoration(
                                                  color: Colors.transparent
                                                      .withAlpha(50),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                child: Center(
                                                  child: TextView(
                                                    textAlign: TextAlign.center,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onSurface,
                                                    text: tech,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ))
                                          .toList(),
                                    ),
                                  ),
                                ],
                              ),
                              TextView(
                                text: data['description'] ?? "",
                                color: Theme.of(context).colorScheme.onSurface,
                                fontSize: 13,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
