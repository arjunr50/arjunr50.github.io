import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/constant.dart';
import 'package:portfolio/core/utils/device_type.dart';
import 'package:portfolio/core/utils/launch_url.dart';
import 'package:portfolio/widgets/social_icons.dart';
import 'package:portfolio/widgets/textview.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({
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
      padding:
          EdgeInsets.symmetric(horizontal: size.width * 0.13, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextView(
            text: "Contact",
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Color(0xff145C9E),
          ),
          TextView(
            text:
                "I'm open to exploring exciting projects, creative collaborations, or simply having a conversation. Feel free to get in touch anytime!",
            fontSize: 16,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          const SizedBox(height: 20),
          Wrap(
            direction: Axis.vertical,
            alignment: WrapAlignment.center,
            spacing: 8,
            children: [
              ContactInfoCard(
                color: Colors.blueAccent,
                icon: Icons.email,
                value: kEmail,
                onClick: () => openUrl('mailto:$kEmail'),
              ),
              ContactInfoCard(
                color: Colors.green,
                icon: Icons.location_on,
                value: "Kochi, kerala, India",
              ),
              ContactInfoCard(
                color: Colors.orange,
                icon: Icons.phone,
                value: kPhoneNo,
                onClick: () => openUrl('tel:$kPhoneNo'),
              ),
            ],
          ),
          const SizedBox(height: 40),
          SocialIcons()
        ],
      ),
    );
  }
}

class ContactInfoCard extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String value;
  final VoidCallback? onClick;

  ContactInfoCard({
    super.key,
    required this.color,
    required this.icon,
    required this.value,
    this.onClick,
  });

  final ValueNotifier<bool> _hovering = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _hovering.value = true,
      onExit: (_) => _hovering.value = false,
      child: ValueListenableBuilder(
        valueListenable: _hovering,
        builder: (context, bool hovering, child) {
          return AnimatedScale(
            scale: _hovering.value ? 1.07 : 1.0,
            duration: const Duration(milliseconds: 200),
            child: GestureDetector(
              onTap: onClick,
              child: Row(
                spacing: 10,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: color.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(20)),
                      child: Icon(icon, color: color, size: 18)),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextView(
                      text: value,
                      fontSize: 12,
                      color: color,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class SocialIconButton extends StatelessWidget {
  final IconData icon;
  final String url;

  const SocialIconButton({
    super.key,
    required this.icon,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Implement launch URL logic here, e.g. using url_launcher
      },
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 28),
      ),
    );
  }
}
