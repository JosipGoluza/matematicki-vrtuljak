import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:matematicki_vrtuljak/my_widgets/about/about_close_button.dart';
import 'package:matematicki_vrtuljak/my_widgets/about/about_fourth_section.dart';
import 'package:matematicki_vrtuljak/my_widgets/about/about_third_section.dart';
import 'package:matematicki_vrtuljak/util/language_constants.dart';
import 'package:url_launcher/url_launcher.dart';

import '../my_widgets/about/about_second_section.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController firstController = ScrollController();

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: LayoutBuilder(
        builder: (context, constraints) {
          var width = constraints.maxWidth;
          var height = constraints.maxHeight;
          var fontSize = min(width * 0.5, height) * 0.05;

          return Scrollbar(
            trackVisibility: true,
            thumbVisibility: true,
            controller: firstController,
            child: SingleChildScrollView(
              controller: firstController,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.1,
                  vertical: height * 0.05,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Image(
                            image: AssetImage(
                                'assets/images/about/logo_ict_aac.png'),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Image(
                            image:
                                AssetImage('assets/images/about/logo_eu.png'),
                          ),
                        ),
                      ],
                    ),
                    AutoSizeText(
                      translation(context).aboutProject,
                      style: TextStyle(
                        fontSize: fontSize,
                      ),
                      // textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    AutoSizeText(
                      translation(context).aboutOtherProjects,
                      style: TextStyle(
                        fontSize: fontSize,
                      ),
                      // textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    AboutSecondSection(
                      fontSize,
                    ),
                    const SizedBox(height: 10),
                    AutoSizeText(
                      translation(context).elementsUsedFrom,
                      style: TextStyle(
                        fontSize: fontSize,
                      ),
                      // textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 10),
                    AboutThirdSection(
                      fontSize,
                    ),
                    AboutFourthSection(
                      fontSize,
                    ),
                    const SizedBox(height: 10),
                    AutoSizeText(
                      translation(context).privacyPolicy,
                      style: TextStyle(
                        fontSize: fontSize,
                      ),
                      // textAlign: TextAlign.start,
                    ),
                    TextButton(
                      onPressed: () {
                        launchUrl(
                          Uri.parse(
                            translation(context).privacyPolicyLink,
                          ),
                        );
                      },
                      child: AutoSizeText(
                        translation(context).privacyPolicyLabel,
                        style: TextStyle(
                          fontSize: fontSize,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        aboutCloseButton(
                          context,
                          width * 0.2,
                          height * 0.1,
                          fontSize,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
