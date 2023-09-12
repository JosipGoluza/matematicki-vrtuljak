import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants/constants.dart';
import '../models/game_symbol.dart';
import '../models/operators.dart';
import '../util/time.dart';
import '../util/user_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _userPreferences = UserPreferences();

  int numberOfRounds = 5;
  int numberOfAnswers = 2;
  bool musicEnabled = false;
  GameSymbol chosenSymbol = GameSymbol.numbers;
  int maxOperationNumber = 2;
  List<Operators> operators = [Operators.add, Operators.subtract];

  @override
  void initState() {
    super.initState();
    _populateSettings();
  }

  Future _populateSettings() async {
    final settings = await _userPreferences.getSettings();
    setState(() {
      numberOfRounds = settings.numberOfRounds;
      numberOfAnswers = settings.numberOfAnswers;
      musicEnabled = settings.musicEnabled;
      chosenSymbol = settings.currentSymbol;
      maxOperationNumber = settings.maxOperationNumber;
      operators = settings.currentOperators;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final currentHeight = MediaQuery.of(context).size.height;
    final signWidth = currentWidth * widthRatioHomeScreen;
    final signHeight = currentHeight * heightRatioHomeScreen;

    final isDesktop =
        currentWidth >= isDesktopWidth || currentHeight >= isDesktopHeight;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/game_bg.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: Image(
                fit: BoxFit.fill,
                height: isDesktop ? 120 : 60,
                image: const AssetImage(
                  'assets/images/sun.png',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(
                isDesktop ? bigScreenPadding : smallScreenPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/pole.png"),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(
                          height: signSeparator,
                        ),
                        InkWell(
                          onTap: () {
                            startTimer(context, '/numbers', numberOfRounds,
                                numberOfAnswers);
                            // generateBeforeStart(context, '/numbers',
                            //     numberOfRounds, numberOfAnswers);
                          },
                          child: Image(
                            fit: BoxFit.fill,
                            image: const AssetImage(
                                'assets/images/hr/button_numbers.png'),
                            width: signWidth,
                            height: signHeight,
                          ),
                        ),
                        const SizedBox(
                          height: signSeparator,
                        ),
                        InkWell(
                          onTap: () {
                            startTimer(
                                context, '/different_sets', numberOfRounds);
                          },
                          child: Image(
                            fit: BoxFit.fill,
                            image: const AssetImage(
                                'assets/images/hr/button_sets.png'),
                            width: signWidth,
                            height: signHeight,
                          ),
                        ),
                        const SizedBox(
                          height: signSeparator,
                        ),
                        InkWell(
                          onTap: () {
                            startTimerOperators(
                              context,
                              '/operations_to_ten',
                              numberOfRounds,
                              numberOfAnswers,
                              operators,
                            );
                          },
                          child: Image(
                            fit: BoxFit.fill,
                            image: const AssetImage(
                                'assets/images/hr/button_operations_10.png'),
                            width: signWidth,
                            height: signHeight,
                          ),
                        ),
                        const SizedBox(
                          height: signSeparator,
                        ),
                        InkWell(
                          onTap: () {
                            startTimerOperators(
                              context,
                              '/operations_to_ten',
                              numberOfRounds,
                              numberOfAnswers,
                              operators,
                              maxOperationNumber,
                            );
                          },
                          child: Image(
                            fit: BoxFit.fill,
                            image: const AssetImage(
                                'assets/images/hr/button_operations.png'),
                            width: signWidth,
                            height: signHeight,
                          ),
                        ),
                        const SizedBox(
                          height: gamesAndSettingsSeparator,
                        ),
                        InkWell(
                          onTap: () {
                            context.go('/settings', extra: _userPreferences);
                          },
                          child: Image(
                            fit: BoxFit.fill,
                            image: const AssetImage(
                                'assets/images/hr/button_settings.png'),
                            width: signWidth,
                            height: signHeight,
                          ),
                        ),
                        const SizedBox(
                          height: signSeparator,
                        ),
                        InkWell(
                          onTap: () {
                            context.go('/about');
                          },
                          child: Image(
                            fit: BoxFit.fill,
                            image: const AssetImage(
                              'assets/images/hr/button_about.png',
                            ),
                            width: signWidth,
                            height: signHeight,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: currentHeight * 0.14),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Image(
                        fit: BoxFit.fill,
                        height: (currentHeight > 500)
                            ? currentHeight * 0.6
                            : currentHeight * 0.75,
                        image: const AssetImage(
                          'assets/images/hr/logo.png',
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//
// // fixed size
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: const EdgeInsets.all(16.0),
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/images/game_bg.png'),
//             fit: BoxFit.fill,
//           ),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Container(
//               decoration: const BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage("assets/images/pole.png"),
//                 ),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: <Widget>[
//                   const SizedBox(
//                     height: 10.0,
//                   ),
//                   InkWell(
//                     onTap: () {
//                       context.go('/numbers');
//                     },
//                     child: const Image(
//                       image: AssetImage(
//                           'assets/images/croatian/button_numbers.png'),
//                       width: 200.0,
//                       height: 40.0,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10.0,
//                   ),
//                   InkWell(
//                     onTap: () {
//                       context.go('/different_sets');
//                     },
//                     child: const Image(
//                       image:
//                           AssetImage('assets/images/croatian/button_sets.png'),
//                       width: 200.0,
//                       height: 40.0,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10.0,
//                   ),
//                   InkWell(
//                     onTap: () {
//                       context.go('/operations_to_ten');
//                     },
//                     child: const Image(
//                       image: AssetImage(
//                           'assets/images/croatian/button_operations_10.png'),
//                       width: 200.0,
//                       height: 40.0,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10.0,
//                   ),
//                   const Image(
//                     image: AssetImage(
//                         'assets/images/croatian/button_operations.png'),
//                     width: 200.0,
//                     height: 40.0,
//                   ),
//                   const SizedBox(
//                     height: 25.0,
//                   ),
//                   InkWell(
//                     onTap: () {
//                       context.go('/settings');
//                     },
//                     child: const Image(
//                       image: AssetImage(
//                           'assets/images/croatian/button_settings.png'),
//                       width: 200.0,
//                       height: 40.0,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10.0,
//                   ),
//                   const Image(
//                     image:
//                         AssetImage('assets/images/croatian/button_about.png'),
//                     width: 200.0,
//                     height: 40.0,
//                   ),
//                 ],
//               ),
//             ),
//             const Text(
//               "Matematički \n Vrtuljak",
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 32.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
