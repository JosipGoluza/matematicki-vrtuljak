import 'package:flutter/material.dart';
import 'package:matematicki_vrtuljak/util/user_preferences.dart';
import 'package:provider/provider.dart';

import 'audio_player_handler.dart';

getResultDifferentSets(
  String path,
  int correctAnswer,
  int otherAnswer,
  Function(Color value) answerBoxCallback,
  List<bool> guessedList,
  BuildContext appContext,
) async {
  UserPreferences userPreferences = UserPreferences();
  var musicEnabled = await userPreferences.getMusicEnabled();
  if (path == "equal") {
    if (guessedList[0] == true) return;
    if (correctAnswer == otherAnswer) {
      if (musicEnabled) {
        var audioPlayerProvider = Provider.of<AudioPlayerProvider>(
          appContext,
          listen: false,
        );
        audioPlayerProvider.playCorrectSoundEffect();
      }
      await answerBoxCallback(Colors.green);
    } else {
      if (musicEnabled) {
        var audioPlayerProvider = Provider.of<AudioPlayerProvider>(
          appContext,
          listen: false,
        );
        audioPlayerProvider.playWrongSoundEffect();
      }
      guessedList[0] = true;
      answerBoxCallback(Colors.red);
    }
  } else {
    if (guessedList[1] == true) return;
    if (correctAnswer != otherAnswer) {
      if (musicEnabled) {
        var audioPlayerProvider = Provider.of<AudioPlayerProvider>(
          appContext,
          listen: false,
        );
        audioPlayerProvider.playCorrectSoundEffect();
      }
      await answerBoxCallback(Colors.green);
    } else {
      if (musicEnabled) {
        var audioPlayerProvider = Provider.of<AudioPlayerProvider>(
          appContext,
          listen: false,
        );
        audioPlayerProvider.playWrongSoundEffect();
      }
      guessedList[1] = true;
      answerBoxCallback(Colors.red);
    }
  }
}
