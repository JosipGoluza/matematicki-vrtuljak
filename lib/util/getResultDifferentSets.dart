import 'package:flutter/material.dart';
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
  if (path == "equal") {
    if (guessedList[0] == true) return;
    if (correctAnswer == otherAnswer) {
      var audioPlayerProvider = Provider.of<AudioPlayerProvider>(
        appContext,
        listen: false,
      );
      audioPlayerProvider.playCorrectSoundEffect();
      await answerBoxCallback(Colors.green);
    } else {
      var audioPlayerProvider =
      Provider.of<AudioPlayerProvider>(
        appContext,
        listen: false,
      );
      audioPlayerProvider.playWrongSoundEffect();
      guessedList[0] = true;
      answerBoxCallback(Colors.red);
    }
  } else {
    if (guessedList[1] == true) return;
    if (correctAnswer != otherAnswer) {
      var audioPlayerProvider = Provider.of<AudioPlayerProvider>(
        appContext,
        listen: false,
      );
      audioPlayerProvider.playCorrectSoundEffect();
      await answerBoxCallback(Colors.green);
    } else {
      var audioPlayerProvider =
      Provider.of<AudioPlayerProvider>(
        appContext,
        listen: false,
      );
      audioPlayerProvider.playWrongSoundEffect();
      guessedList[1] = true;
      answerBoxCallback(Colors.red);
    }
  }
}
