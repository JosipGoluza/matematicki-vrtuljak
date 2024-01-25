import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../util/language_constants.dart';

class AboutFourthSection extends StatelessWidget {
  double fontSize;

  AboutFourthSection(this.fontSize, {super.key});

  @override
  Widget build(BuildContext context) {
    final Uri url = Uri.parse(translation(context).openGameArtLink);

    return AutoSizeText.rich(
      TextSpan(
        style: TextStyle(fontSize: fontSize),
        children: [
          TextSpan(
            text: translation(context).openGameArt,
            style: const TextStyle(color: Colors.black),
          ),
          TextSpan(
            text: translation(context).openGameArtLink,
            style: const TextStyle(color: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                launchUrl(url);
              },
          ),
          TextSpan(
            text: translation(context).openGameArtRest,
            style: const TextStyle(color: Colors.black),
          )
        ],
      ),
      // textAlign: TextAlign.center,
    );
  }
}
