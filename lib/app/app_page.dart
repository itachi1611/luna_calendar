import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:luna_calendar/app/app_cubit.dart';

import '../generated/l10n.dart';
import '../router/app_router.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  late final AppRouter appRouter;
  late final AppCubit appCubit;

  @override
  void initState() {
    super.initState();
    appRouter = AppRouter();
    appCubit = AppCubit()
      ..init();
  }

  @override
  void dispose() {
    appCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>.value(value: appCubit),
      ],
      child: BlocBuilder<AppCubit, AppState>(
        buildWhen: (pre, cur) => pre.locale != cur.locale,
        builder: (context, state) {
          return MaterialApp.router(
            title: 'Fox Utils',
            debugShowCheckedModeBanner: false,
            // Todo: Implement AppTheme
            routerConfig: appRouter.router,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              S.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: state.locale,
            localeResolutionCallback: (deviceLocale, supportLocales) {
              if(state.locale != null) {
                return state.locale;
              }

              if(deviceLocale != null) {
                final matchedLocale = supportLocales.firstWhere(
                  (locale) => locale.languageCode == deviceLocale.languageCode,
                  orElse: () => supportLocales.first, // Fallback về locale đầu tiên
                );
                return matchedLocale;
              }

              return supportLocales.first;
            },
          );
        },
      ),
    );
  }
}
