import 'package:amoora/common/services/notification_service.dart';
import 'package:amoora/common/services/talker_service.dart';
import 'package:amoora/common/services/timezone_service.dart';
import 'package:amoora/core/app_theme.dart';
import 'package:amoora/common/services/sharedpref_service.dart';
import 'package:amoora/utils/theme_utils.dart';
import 'package:amoora/utils/maps_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amoora/utils/router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_flutter/talker_flutter.dart';

final scaffoldKey = GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureLocalTimeZone();
  await initializeFlutterLocalNotifications();
  await initializeMapImplementation();

  final pref = await SharedPreferences.getInstance();
  final talker = TalkerFlutter.init();

  runApp(
    ProviderScope(
      overrides: [
        sharedPrefProvider.overrideWithValue(pref),
        talkerProvider.overrideWithValue(talker),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      theme: AppTheme.lightThemeData,
      darkTheme: AppTheme.darkThemeData,
      // darkTheme: ThemeData.dark(),
      themeMode: themeMode,
      routerConfig: goRouter,
      scaffoldMessengerKey: scaffoldKey,
    );
    // return Wiredash(
    //   projectId: Env.wiredashPID,
    //   secret: Env.wiredashSecret,
    //   child: MaterialApp.router(
    //     debugShowCheckedModeBanner: false,
    //     supportedLocales: AppLocalizations.supportedLocales,
    //     localizationsDelegates: AppLocalizations.localizationsDelegates,
    //     theme: AppTheme.lightThemeData,
    //     darkTheme: AppTheme.darkThemeData,
    //     // darkTheme: ThemeData.dark(),
    //     themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
    //     routerConfig: goRouter,
    //     scaffoldMessengerKey: scaffoldKey,
    //   ),
    // );
  }
}
