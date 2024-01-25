import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../util/language_constants.dart';

class AboutSecondSection extends StatelessWidget {
  double fontSize;

  AboutSecondSection(this.fontSize, {super.key});

  @override
  Widget build(BuildContext context) {
    final Uri url = Uri.parse(translation(context).newVersionLink);

    return AutoSizeText.rich(
      TextSpan(
        style: TextStyle(fontSize: fontSize),
        children: [
          TextSpan(
            text: translation(context).newVersion,
            style: const TextStyle(color: Colors.black),
          ),
          TextSpan(
            text: "ICTAAC",
            style: const TextStyle(color: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                launchUrl(url);
              },
          ),
        ],
      ),
      // textAlign: TextAlign.center,
    );
  }
}
