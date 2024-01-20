import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:matematicki_vrtuljak/routes.dart';
import 'package:matematicki_vrtuljak/util/audio_player_handler.dart';
import 'package:matematicki_vrtuljak/util/language_constants.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen.withScreenFunction(
        duration: 2000,
        splash: 'assets/images/intro_logo.png',
        screenFunction: () async {
          return const MyApp();
        },
        pageTransitionType: PageTransitionType.fade,
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static void setLocale(BuildContext context, Locale newLocale) async {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) => setLocale(locale));
    super.didChangeDependencies();
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
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: _locale,
      ),
    );
  }
}
