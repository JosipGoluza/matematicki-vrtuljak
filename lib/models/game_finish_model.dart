class GameFinishModel {
  int correctGuesses;
  int wrongGuesses;
  Duration timeElapsed;

  GameFinishModel({
    required this.correctGuesses,
    required this.wrongGuesses,
    required this.timeElapsed,
  });
}
