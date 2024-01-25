import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../util/language_constants.dart';

class AboutThirdSection extends StatelessWidget {
  double fontSize;

  AboutThirdSection(this.fontSize, {super.key});

  @override
  Widget build(BuildContext context) {
    final Uri url1 = Uri.parse(translation(context).arasaacLink);
    final Uri url2 = Uri.parse(translation(context).arasaacLicenseLink);

    return AutoSizeText.rich(
      TextSpan(
        style: TextStyle(fontSize: fontSize),
        children: [
          TextSpan(
            text: translation(context).arasaacProperty,
            style: const TextStyle(color: Colors.black),
          ),
          TextSpan(
            text: "CATEDU",
            style: const TextStyle(color: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                launchUrl(url1);
              },
          ),
          TextSpan(
            text: translation(context).arasaacLicense,
            style: const TextStyle(color: Colors.black),
          ),
          TextSpan(
            text: "Creative Commons",
            style: const TextStyle(color: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                launchUrl(url2);
              },
          ),
          TextSpan(
            text: translation(context).arasaacAuthor,
            style: const TextStyle(color: Colors.black),
          )
        ],
      ),
      // textAlign: TextAlign.center,
    );
  }
}
