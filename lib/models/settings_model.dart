
class SettingsModel {
  int numberOfRounds;
  int numberOfAnswers;
  bool musicEnabled;
  String symbolName;
  int numberOfTasks;

  SettingsModel({
    required this.numberOfRounds,
    required this.numberOfAnswers,
    required this.musicEnabled,
    required this.symbolName,
    required this.numberOfTasks,
  });
}