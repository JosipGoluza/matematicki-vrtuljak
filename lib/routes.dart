import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matematicki_vrtuljak/models/game_finish_model.dart';
import 'package:matematicki_vrtuljak/screens/about.dart';
import 'package:matematicki_vrtuljak/screens/different_sets.dart';
import 'package:matematicki_vrtuljak/screens/game_finish.dart';
import 'package:matematicki_vrtuljak/screens/home.dart';
import 'package:matematicki_vrtuljak/screens/numbers.dart';
import 'package:matematicki_vrtuljak/screens/operations.dart';
import 'package:matematicki_vrtuljak/screens/operations_to_ten.dart';
import 'package:matematicki_vrtuljak/screens/settings.dart';
import 'package:matematicki_vrtuljak/util/user_preferences.dart';

import 'models/start_game_model.dart';

GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/numbers',
      pageBuilder: (context, state) {
        StartNumbersGameModel startGameModel =
            state.extra as StartNumbersGameModel;
        return CustomTransitionPage(
          child: Numbers(startGameModel: startGameModel),
          key: UniqueKey(),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: '/different_sets',
      pageBuilder: (context, state) {
        StartDifferentSetsGameModel startGameModel =
            state.extra as StartDifferentSetsGameModel;
        return CustomTransitionPage(
          child: DifferentSets(startGameModel: startGameModel),
          key: UniqueKey(),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: '/operations_to_ten',
      builder: (context, state) => const OperationsToTen(),
    ),
    GoRoute(
      path: '/operations',
      builder: (context, state) => const Operations(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) {
        UserPreferences userPreferences = state.extra as UserPreferences;
        return Settings(
          userPreferences: userPreferences,
        );
      },
    ),
    GoRoute(
      path: '/about',
      builder: (context, state) => const About(),
    ),
    GoRoute(
      path: '/end_game',
      builder: (context, state) {
        GameFinishModel gameFinishModel = state.extra as GameFinishModel;
        return GameFinish(
          gameFinishModel: gameFinishModel,
        );
      },
    )
  ],
);
