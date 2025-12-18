import 'package:flutter/material.dart';
import 'package:portfolio/widgets/textview.dart';

class TuduPrivacyPolicy extends StatelessWidget {
  const TuduPrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(60),
            child: Column(
              children: [
                TextView(
                  text: "Privacy Policy for TUDU",
                  fontSize: 30,
                ),
                TextView(
                  text: '''
Effective Date: 2025-12-18

TUDU is a minimal to-do application designed to help users manage tasks efficiently. Your privacy is important to us, and this policy explains how your information is handled.

Information Collection and Use

TUDU does not collect, store, transmit, or share any personal information. All tasks and data entered by the user are stored locally on the device and never leave the device.

No user data is sent to external servers, cloud services, or third parties.

Local Data Storage

All to-do items and related information are stored locally using on-device storage. This data remains fully under the user’s control and is removed if the app is uninstalled.

Third-Party Services

TUDU does not use third-party analytics, advertising services, or external SDKs that collect user data.

Children’s Privacy

TUDU does not knowingly collect any personal information from children under the age of 18. Since no data is collected at all, the app is safe for all age groups.

Data Security

As all data is stored locally on your device, its security depends on your device’s security settings. TUDU does not have access to your data.

Changes to This Privacy Policy

This privacy policy may be updated from time to time. Any changes will be reflected within the app or on the app’s official page.

Contact Us

If you have any questions about this Privacy Policy, please contact us at:
arjunrkofficial@gmail.com
''',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
