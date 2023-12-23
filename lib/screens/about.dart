import 'package:flutter/material.dart';
import 'package:matematicki_vrtuljak/my_widgets/exit_button.dart';
import 'package:url_launcher/link.dart';

import '../constants/constants.dart';
import '../localizations/about_localization.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Scaffold(
            backgroundColor: Colors.grey[350],
            body: LayoutBuilder(
              builder: (context, constraints) {
                // stack is used to set pause button on top right corner
                return Stack(
                  children: [
                    Center(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Column(
                                children: [
                                  Text(
                                    about.i18n,
                                    style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    aboutProject.i18n,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    elementsUsedFrom.i18n,
                                    style: const TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Link(
                                    target: LinkTarget.blank,
                                    uri: Uri.parse(
                                        'http://www.catedu.es/arasaac'),
                                    builder: (context, followLink) {
                                      return GestureDetector(
                                        onTap: followLink,
                                        child: const Text(
                                          'http://www.catedu.es/arasaac',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.blueAccent,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 10),
                                  Link(
                                    target: LinkTarget.blank,
                                    uri: Uri.parse('http://opengameart.org'),
                                    builder: (context, followLink) {
                                      return GestureDetector(
                                        onTap: followLink,
                                        child: const Text(
                                          'http://opengameart.org',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.blueAccent,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(smallScreenPadding),
                      child: ExitButton(
                          constraints.maxWidth, constraints.maxHeight),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
