import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:matematicki_vrtuljak/routes.dart';
import 'package:matematicki_vrtuljak/util/audio_player_handler.dart';
import 'package:matematicki_vrtuljak/util/user_preferences.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'models/language.dart';

void main() {
  runApp(const SplashScreenState());
}

class SplashScreenState extends StatefulWidget {
  const SplashScreenState({super.key});

  @override
  State<SplashScreenState> createState() => _SplashScreenStateState();
}

class _SplashScreenStateState extends State<SplashScreenState> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen.withScreenFunction(
        duration: 2000,
        splash: 'assets/images/intro_logo.png',
        screenFunction: () async {
          var locale = await getInitialLanguage();
          return MyApp(locale: locale);
        },
        pageTransitionType: PageTransitionType.fade,
      ),
    );
  }

  Future<Locale> getInitialLanguage() async {
    final userPreferences = UserPreferences();
    final settings = await userPreferences.getSettings();
    return getLanguageFromName(settings.languageOptions);
  }
}

class MyApp extends StatefulWidget {
  Locale locale;

  MyApp({super.key, required this.locale});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  get locale => widget.locale;

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
        initialLocale: locale,
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
            Locale('es', "ES"),
            Locale('fr', "FR"),
            Locale('pt', "PT"),
            Locale('hu', "HU"),
          ],
        ),
      ),
    );
  }
}
