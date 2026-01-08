import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:luna_calendar/router/app_transition.dart';

import '../ui/ui.dart';
import 'routers.dart';
import 'navigator_observer.dart';

final kRoot = GlobalKey<NavigatorState>(debugLabel: 'kRoot');
final kShell = GlobalKey<NavigatorState>(debugLabel: 'kShell');

class AppRouter {
  // Private constructor
  AppRouter._internal();

  // Singleton instance
  static final AppRouter _instance = AppRouter._internal();

  // Factory constructor to return the same instance
  factory AppRouter() => _instance;

  // Getter for the router instance
  GoRouter get router => _router;

  // Lazy initialization of the router
  late final GoRouter _router = GoRouter(
    initialLocation: Uri.base.toString(),
    onException: (context, state, router) {
      router.go(Routers.notFound.routerPath, extra: state.uri.toString());
    },
    navigatorKey: kRoot,
    debugLogDiagnostics: true,
    redirect: (context, state) {
      if(state.matchedLocation == Routers.notFound.routerPath) {
        return Routers.notFound.routerPath;
      }

      return null;
    },
    redirectLimit: 10,
    observers: [NavObserver()],
    routes: [
      _splash,
      _intro,
      _home,
    ],
  );
}

// Child routers
GoRoute get _splash => GoRoute(
  path: Routers.root.routerPath,
  name: Routers.root.routerName,
  builder: (context, state) => const SplashPage(),
);

GoRoute get _intro => GoRoute(
  path: Routers.intro.routerPath,
  name: Routers.intro.routerName,
  pageBuilder: (context, state) => TransitionPage(
    child: const IntroPage(),
    transitionType: PageTransitionType.scale,
  ),
);

GoRoute get _home => GoRoute(
  path: Routers.home.routerPath,
  name: Routers.home.routerName,
  pageBuilder: (context, state) => TransitionPage(
    child: const HomePage(),
    transitionType: PageTransitionType.slideFromBottomFade
  )
);






