class GameFinishModel {
  int correctGuesses;
  int wrongGuesses;
  Duration timeElapsed;
  String path;

  GameFinishModel({
    required this.correctGuesses,
    required this.wrongGuesses,
    required this.timeElapsed,
    required this.path,
  });
}
