import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:overlayment/overlayment.dart';
import 'package:url_strategy/url_strategy.dart';

import 'application/app_router.dart';
import 'application/app_theme.dart';
import 'core/data/services/locator.dart';
import 'core/domain/locale_bloc/locale_cubit.dart';
import 'core/domain/theme_bloc/theme_bloc.dart';
import 'core/utils/session_manager.dart';
import 'l10n/app_localizations.dart';


void main() async {
  try {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

    FlutterSecureStorage sharedPreferences = const FlutterSecureStorage();


   await Future.wait([
     setupLocator(sharedPreferences),
    ]);

   setPathUrlStrategy();

  } catch (e) {
    logger.e(e.toString());
  }


  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
  providers: [
    BlocProvider(
      create: (context) => ThemeBloc()..add(InitialTheme(context: context)),
),
    BlocProvider(
      create: (context) => LocaleCubit(),
    ),
  ],
  child: BlocBuilder<LocaleCubit, Locale>(
    builder: (context, locale) {
    return BlocConsumer<ThemeBloc, ThemeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          ThemeData selectedTheme = AppTheme.goalLightTheme;
          ThemeData darkTheme = AppTheme.goalDarkTheme;
          if(state is ThemeLoaded) {
            selectedTheme = state.theme;
            darkTheme =  ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: selectedTheme.colorScheme.primary,
                  primary: selectedTheme.colorScheme.primary,
                  brightness: Brightness.dark
              ),
            );
          }
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: SessionManager.userInteracted,
            onPanDown: (_) => SessionManager.userInteracted(),
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              title: 'Goal Planning',
              themeMode: ThemeMode.dark,
              theme: selectedTheme,
              darkTheme: darkTheme,
              locale: locale,
              routerConfig: _appRouter.config(),
            ),
          );
        },
      );
  },
  ),
);
  }

  @override
  void initState() {
    super.initState();
    Overlayment.navigationKey = _appRouter.navigatorKey;
    Future.delayed(const Duration(seconds: 1), () => FlutterNativeSplash.remove());
  }
}
