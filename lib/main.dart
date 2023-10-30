import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:matematicki_vrtuljak/routes.dart';
import 'package:matematicki_vrtuljak/util/audio_player_handler.dart';
import 'package:matematicki_vrtuljak/util/user_preferences.dart';
import 'package:provider/provider.dart';

import 'models/language.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _userPreferences = UserPreferences();

  late Locale currentLanguage;

  @override
  void initState() {
    super.initState();
    getInitialLanguage();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    return ChangeNotifierProvider(
      create: (context) => AudioPlayerProvider(),
      child: I18n(
        initialLocale: currentLanguage,
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', "US"),
            Locale('hr', "HR"),
          ],
        ),
      ),
    );
  }

  Future getInitialLanguage() async {
    final settings = await _userPreferences.getSettings();
    setState(() {
      currentLanguage = getLanguageFromName(settings.languageOptions);
    });
  }
}
