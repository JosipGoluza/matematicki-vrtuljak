import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matematicki_vrtuljak/settings_widgets/radio_button_answers.dart';
import 'package:matematicki_vrtuljak/settings_widgets/radio_button_music.dart';
import 'package:matematicki_vrtuljak/settings_widgets/radio_button_rounds.dart';
import 'package:matematicki_vrtuljak/settings_widgets/radio_button_symbols.dart';
import 'package:matematicki_vrtuljak/settings_widgets/radio_button_tasks.dart';
import 'package:matematicki_vrtuljak/settings_widgets/settings_alert_dialog.dart';
import 'package:matematicki_vrtuljak/util/user_preferences.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../models/game_symbol.dart';
import '../models/operators.dart';
import '../models/settings_model.dart';
import '../my_widgets/pause_button.dart';
import '../settings_widgets/radio_button_operations.dart';
import '../util/audio_player_handler.dart';

class Settings extends StatefulWidget {
  UserPreferences userPreferences;

  Settings({
    Key? key,
    required this.userPreferences,
  }) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  SettingsModel sharedPrefs = SettingsModel(
    numberOfRounds: 5,
    numberOfAnswers: 2,
    musicEnabled: false,
    currentSymbol: GameSymbol.numbers,
    maxOperationNumber: 2,
    currentOperators: [Operators.add, Operators.subtract],
  );

  roundsCallback(int value) {
    setState(() {
      sharedPrefs.numberOfRounds = value;
    });
  }

  answersCallback(int value) {
    setState(() {
      sharedPrefs.numberOfAnswers = value;
    });
  }

  Future<void> musicCallback(bool shouldPlay) async {
    await updateAudioPlayerState(shouldPlay);
    setState(() {
      sharedPrefs.musicEnabled = shouldPlay;
    });
  }

  symbolsCallback(GameSymbol value) {
    setState(() {
      sharedPrefs.currentSymbol = value;
    });
  }

  tasksCallback(int value) {
    setState(() {
      sharedPrefs.maxOperationNumber = value;
    });
  }

  operatorsCallback(List<Operators> value) {
    setState(() {
      sharedPrefs.currentOperators = value;
    });
  }

  Future saveSettings() async {
    // Delay is added to prevent wrong settings being saved
    await Future.delayed(const Duration(milliseconds: 500));

    final newSettings = SettingsModel(
      numberOfRounds: sharedPrefs.numberOfRounds,
      numberOfAnswers: sharedPrefs.numberOfAnswers,
      musicEnabled: sharedPrefs.musicEnabled,
      currentSymbol: sharedPrefs.currentSymbol,
      maxOperationNumber: sharedPrefs.maxOperationNumber,
      currentOperators: sharedPrefs.currentOperators,
    );
    await widget.userPreferences.saveSettings(newSettings);
  }

  Widget settingsDesktop() {
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
                        'POSTAVKE',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      RadioButtonRounds(
                        roundsCallback,
                        sharedPrefs.numberOfRounds,
                      ),
                      const SizedBox(height: 10),
                      RadioButtonAnswers(
                        answersCallback,
                        sharedPrefs.numberOfAnswers,
                      ),
                      const SizedBox(height: 10),
                      RadioButtonMusic(musicCallback, sharedPrefs.musicEnabled),
                      const SizedBox(height: 15),
                      const Text(
                        "POSTAVKE ZA IGRU \"OPERACIJE\"",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      RadioButtonSymbols(
                          symbolsCallback,
                          sharedPrefs.currentSymbol,
                          tasksCallback,
                          sharedPrefs.maxOperationNumber),
                      const SizedBox(height: 10),
                      RadioButtonTasks(
                          tasksCallback,
                          sharedPrefs.maxOperationNumber,
                          sharedPrefs.currentSymbol),
                      const SizedBox(height: 10),
                      RadioButtonOperations(
                        operatorsCallback,
                        sharedPrefs.currentOperators,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () => {
                              if (sharedPrefs.currentOperators.isEmpty)
                                {showAlertDialog(context)}
                              else
                                {goHome(context)}
                            },
                            child: const Text('Save settings'),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () => {
                              context.go('/'),
                            },
                            child: const Text('Cancel'),
                          ),
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

  Widget settingsMobile() {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      // stack is used to set pause button on top right corner
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'POSTAVKE',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  RadioButtonRounds(
                    roundsCallback,
                    sharedPrefs.numberOfRounds,
                  ),
                  RadioButtonAnswers(
                    answersCallback,
                    sharedPrefs.numberOfAnswers,
                  ),
                  RadioButtonMusic(
                    musicCallback,
                    sharedPrefs.musicEnabled,
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "POSTAVKE ZA IGRU \"OPERACIJE\"",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  RadioButtonSymbols(
                    symbolsCallback,
                    sharedPrefs.currentSymbol,
                    tasksCallback,
                    sharedPrefs.maxOperationNumber,
                  ),
                  const SizedBox(height: 10),
                  RadioButtonTasks(
                    tasksCallback,
                    sharedPrefs.maxOperationNumber,
                    sharedPrefs.currentSymbol,
                  ),
                  const SizedBox(height: 10),
                  RadioButtonOperations(
                    operatorsCallback,
                    sharedPrefs.currentOperators,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () async => {
                          if (sharedPrefs.currentOperators.isEmpty)
                            {showAlertDialog(context)}
                          else
                            {
                              goHome(context),
                            }
                        },
                        child: const Text('Save settings'),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () => {
                          context.go('/'),
                        },
                        child: const Text('Cancel'),
                      ),
                    ],
                  ),
                ],
              ),
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
  void initState() {
    super.initState();
    initializeSettingsPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= isDesktopWidth ||
              constraints.maxHeight >= isDesktopHeight) {
            return settingsDesktop();
          } else {
            return settingsMobile();
          }
        },
      ),
    );
  }

  Future<void> initializeSettingsPreferences() async {
    await widget.userPreferences.getSettings().then(
          (value) => {
            setState(
              () {
                sharedPrefs = value;
              },
            ),
          },
        );
  }

  updateAudioPlayerState(bool shouldPlay) {
    final audioPlayer = Provider.of<AudioPlayerProvider>(
      context,
      listen: false,
    ).audioPlayer;
    if (shouldPlay) {
      audioPlayer.play();
    } else {
      audioPlayer.pause();
    }
  }

  Future<void> goHome(BuildContext context) async {
    await saveSettings();
    context.go('/');
  }
}
