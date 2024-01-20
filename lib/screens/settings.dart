import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matematicki_vrtuljak/my_widgets/exit_button.dart';
import 'package:matematicki_vrtuljak/settings_widgets/radio_button_answers.dart';
import 'package:matematicki_vrtuljak/settings_widgets/radio_button_language.dart';
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
import '../settings_widgets/radio_button_operations.dart';
import '../util/audio_player_handler.dart';
import '../util/language_constants.dart';

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
    maxOperationNumber: 5,
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

  @override
  void initState() {
    super.initState();
    initializeSettingsPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      // stack is used to set pause button on top right corner
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          translation(context).settingsTitle,
                          style: TextStyle(
                            fontSize:
                                constraints.maxWidth / settingsFontSizeTitle,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        RadioButtonRounds(
                          roundsCallback,
                          sharedPrefs.numberOfRounds,
                          constraints.maxWidth,
                        ),
                        const SizedBox(height: 10),
                        RadioButtonAnswers(
                          answersCallback,
                          sharedPrefs.numberOfAnswers,
                          constraints.maxWidth,
                        ),
                        const SizedBox(height: 10),
                        RadioButtonMusic(
                          musicCallback,
                          sharedPrefs.musicEnabled,
                          constraints.maxWidth,
                        ),
                        const SizedBox(height: 10),
                        RadioButtonLanguage(
                          constraints.maxWidth,
                        ),
                        const SizedBox(height: 15),
                        Text(
                          translation(context).operationGameSettings,
                          style: TextStyle(
                            fontSize:
                                constraints.maxWidth / settingsFontSizeTitle,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        RadioButtonSymbols(
                          symbolsCallback,
                          sharedPrefs.currentSymbol,
                          tasksCallback,
                          sharedPrefs.maxOperationNumber,
                          constraints.maxWidth,
                        ),
                        const SizedBox(height: 10),
                        RadioButtonTasks(
                          tasksCallback,
                          sharedPrefs.maxOperationNumber,
                          sharedPrefs.currentSymbol,
                          constraints.maxWidth,
                        ),
                        const SizedBox(height: 10),
                        RadioButtonOperations(
                          operatorsCallback,
                          sharedPrefs.currentOperators,
                          constraints.maxWidth,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: constraints.maxWidth * settingsButtonSizeWidth,
                              height: constraints.maxHeight * settingsButtonSizeHeight,
                              child: ElevatedButton(
                                onPressed: () => {
                                  context.go('/'),
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.grey.shade400),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(
                                        width: 3,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                  ),
                                ),
                                child: Text(
                                  translation(context).cancelSettingsLocalization,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: constraints.maxWidth * settingsButtonSizeWidth,
                              height: constraints.maxHeight * settingsButtonSizeHeight,
                              child: ElevatedButton(
                                onPressed: () async => {
                                  if (sharedPrefs.currentOperators.isEmpty)
                                    {showAlertDialog(context)}
                                  else
                                    {goHome(context)}
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.green.shade400),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(
                                        width: 3,
                                        color: Colors.green.shade600,
                                      ),
                                    ),
                                  ),
                                ),
                                child: Text(
                                  translation(context).saveSettingsLocalization,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(smallScreenPadding),
                child: ExitButton(constraints.maxWidth, constraints.maxHeight),
              ),
            ],
          );
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
