import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:matematicki_vrtuljak/localizations/settings_widgets_localization.dart';
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
import '../models/language.dart';
import '../models/operators.dart';
import '../models/settings_model.dart';
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
    maxOperationNumber: 5,
    currentOperators: [Operators.add, Operators.subtract],
    languageOptions: LanguageOptions.english,
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

  languageCallback(LanguageOptions value) {
    setState(() {
      sharedPrefs.languageOptions = value;
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
      languageOptions: sharedPrefs.languageOptions,
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
                          settingsTitle.i18n,
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
                          languageCallback,
                          sharedPrefs.languageOptions,
                          constraints.maxWidth,
                        ),
                        const SizedBox(height: 15),
                        Text(
                          operationGameSettings.i18n,
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
                            ElevatedButton(
                              onPressed: () async => {
                                if (sharedPrefs.currentOperators.isEmpty)
                                  {showAlertDialog(context)}
                                else
                                  {
                                    I18n.of(context).locale =
                                        getLanguageFromName(
                                      sharedPrefs.languageOptions,
                                    ),
                                    goHome(context)
                                  }
                              },
                              child: Text(saveSettingsLocalization.i18n),
                            ),
                            const SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () => {
                                context.go('/'),
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                              child: Text(
                                cancelSettingsLocalization.i18n,
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
