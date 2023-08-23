import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matematicki_vrtuljak/models/game_finish_model.dart';

import '../constants/constants.dart';
import '../my_widgets/pause_button.dart';

class GameFinish extends StatefulWidget {
  GameFinishModel gameFinishModel;

  GameFinish({
    Key? key,
    required this.gameFinishModel,
  }) : super(key: key);

  @override
  State<GameFinish> createState() => _GameFinishState();
}

class _GameFinishState extends State<GameFinish> {
  Widget correctGuesses() {
    return Row(
      children: [
        const Expanded(
            child: Text(
          'BROJ POGODAKA',
          textAlign: TextAlign.end,
        )),
        const SizedBox(
          width: settingsRowMargin,
        ),
        Expanded(
          child: Text(
            widget.gameFinishModel.correctGuesses.toString(),
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }

  Widget wrongGuesses() {
    return Row(
      children: [
        const Expanded(
            child: Text(
          'BROJ PROMAŠAJA',
          textAlign: TextAlign.end,
        )),
        const SizedBox(
          width: settingsRowMargin,
        ),
        Expanded(
          child: Text(
            widget.gameFinishModel.wrongGuesses.toString(),
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }

  Widget timeTaken() {
    return Row(
      children: [
        const Expanded(
            child: Text(
          'UKUPNO VRIJEME',
          textAlign: TextAlign.end,
        )),
        const SizedBox(
          width: settingsRowMargin,
        ),
        Expanded(
          child: Text(
            '${widget.gameFinishModel.timeElapsed.inMinutes.toString()} min ${widget.gameFinishModel.timeElapsed.inSeconds.toString()} s',
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }

  Widget gameFinishDesktop() {
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
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Center(
                child: Container(
                  color: Colors.grey[350],
                  width: 700,
                  height: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'IGRA GOTOVA',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      correctGuesses(),
                      const SizedBox(height: 20),
                      wrongGuesses(),
                      const SizedBox(height: 20),
                      timeTaken(),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () => {
                              context.go('/'),
                            },
                            child: const Text('POVRATAK'),
                          ),
                          // DODATI NOVU IGRU !!!
                          // const SizedBox(width: 10),
                          // ElevatedButton(
                          //   onPressed: () => {
                          //     context.go('/'),
                          //   },
                          //
                          //   child: const Text('IGRAJ PONOVNO'),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.all(bigScreenPadding),
            child: PauseButton(),
          ),
        ],
      ),
    );
  }

  Widget gameFinishMobile() {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      // stack is used to set pause button on top right corner
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'IGRA GOTOVA',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                correctGuesses(),
                const SizedBox(height: 20),
                wrongGuesses(),
                const SizedBox(height: 20),
                timeTaken(),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => {
                        context.go('/'),
                      },
                      child: const Text('POVRATAK'),
                    ),
                    // DODATI NOVU IGRU !!!
                    // const SizedBox(width: 10),
                    // ElevatedButton(
                    //   onPressed: () => {
                    //     context.go('/'),
                    //   },
                    //   // dodati novu igru
                    //   child: const Text('IGRAJ PONOVNO'),
                    // ),
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(smallScreenPadding),
            child: PauseButton(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= isDesktopWidth ||
              constraints.maxHeight >= isDesktopHeight) {
            return gameFinishDesktop();
          } else {
            return gameFinishMobile();
          }
        },
      ),
    );
  }
}
