import 'package:matematicki_vrtuljak/models/game_symbol.dart';
import 'package:matematicki_vrtuljak/models/settings_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  Future saveSettings(SettingsModel settings) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('numberOfRounds', settings.numberOfRounds);
    await prefs.setInt('numberOfAnswers', settings.numberOfAnswers);
    await prefs.setBool('musicEnabled', settings.musicEnabled);
    await prefs.setString('symbol', settings.symbolName);
    await prefs.setInt('numberOfTasks', settings.numberOfTasks);
    await prefs.setStringList(
      'currentOperators',
      settings.currentOperators,
    );
  }

  Future <SettingsModel> getSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final numberOfRounds = prefs.getInt('numberOfRounds') ?? 5;
    final numberOfAnswers = prefs.getInt('numberOfAnswers') ?? 2;
    final musicEnabled = prefs.getBool('musicEnabled') ?? false;
    final symbolName = prefs.getString('symbol') ?? GameSymbol.numbers.name;
    final numberOfTasks = prefs.getInt('numberOfTasks') ?? 2;
    final currentOperators = prefs.getStringList('currentOperators') ?? ['+', '-'];

    return SettingsModel(
      numberOfRounds: numberOfRounds,
      numberOfAnswers: numberOfAnswers,
      musicEnabled: musicEnabled,
      symbolName: symbolName,
      numberOfTasks: numberOfTasks,
      currentOperators: currentOperators,
    );
  }
}
