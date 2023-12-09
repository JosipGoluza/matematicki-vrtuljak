import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

import '../constants/constants.dart';
import '../my_widgets/pause_button.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  Widget aboutMobile() {
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
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          children: [
                            const Text(
                              "O NAMA",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              "Aplikaciju Matematički vrtuljak izradio je Josip Goluža, student Fakulteta elektrotehnike i računarstva u Zagrebu. Aplikacija je izrađena u svrhu završnog rada na preddiplomskom studiju kao dorada postojećoj aplikaciji Matematički vrtuljak.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Korišteni elementi zvuka i grafike preuzeti su sa stranica:",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Link(
                              target: LinkTarget.blank,
                              uri: Uri.parse('http://www.catedu.es/arasaac'),
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
                child: PauseButton(constraints.maxWidth, constraints.maxHeight),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return aboutMobile();
        },
      ),
    );
  }
}
