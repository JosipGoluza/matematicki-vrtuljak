import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

import '../constants/constants.dart';
import '../my_widgets/pause_button.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  Widget aboutDesktop() {
    return Container(
      padding: const EdgeInsets.all(bigScreenPadding),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/game_bg.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Stack(
        children: [
          Center(
            child: Container(
              color: Colors.grey[350],
              width: 700,
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(bigScreenPadding),
            child: PauseButton(),
          ),
        ],
      ),
    );
  }

  Widget aboutMobile() {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      // stack is used to set pause button on top right corner
      body: Stack(children: [
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
        const Padding(
          padding: EdgeInsets.all(smallScreenPadding),
          child: PauseButton(),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= isDesktopWidth ||
              constraints.maxHeight >= isDesktopHeight) {
            return aboutDesktop();
          } else {
            return aboutMobile();
          }
        },
      ),
    );
  }
}
