import 'package:dnd/adaptive/loading_indicator.dart';
import 'package:dnd/app_theme.dart';
import 'package:dnd/environment.dart';
import 'package:dnd/pages/warning_screen.dart';
import 'package:dnd/router.dart';
import 'package:dnd/services/language_service.dart';
import 'package:dnd/services/shared_preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
    url: Environment.subabaseUrl,
    anonKey: Environment.supabaseAnonKey,
  );
  final sharedPreferences = await SharedPreferences.getInstance();
  String languageData =
      await rootBundle.loadString("assets/jsons/languages.json");

  return runApp(ProviderScope(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      languageJsonDataProvider.overrideWithValue(languageData)
    ],
    child: const MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  static final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData themeData =
        AppTheme.getThemeFromThemeMode(1); //Use light theme for now
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarBrightness: themeData.brightness,
        statusBarIconBrightness: themeData.brightness,
        systemNavigationBarIconBrightness: themeData.brightness,
        statusBarColor: themeData.primaryColor,
        systemNavigationBarColor: themeData.primaryColor,
        systemNavigationBarDividerColor: themeData.primaryColor));
  
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      builder:
          EasyLoading.init(builder: (BuildContext context, Widget? widget) {
        EasyLoading.instance
          ..loadingStyle = EasyLoadingStyle.custom
          ..indicatorType = EasyLoadingIndicatorType.ring
          ..backgroundColor = Colors.white
          ..indicatorColor = Theme.of(context).primaryColor
          ..maskType = EasyLoadingMaskType.black
          ..textColor = Theme.of(context).primaryColor;

        return Builder(builder: (context) {
          ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
            return const WarningScreen();
          };
          if (widget == null) {
            return const AdaptiveLoadingIndicator();
          }
          return widget;
        });
      }),
      title: 'DnD',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
