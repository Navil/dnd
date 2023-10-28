import 'package:dnd/adaptive/loading_indicator.dart';
import 'package:dnd/app_theme.dart';
import 'package:dnd/router.dart';
import 'package:dnd/screens/warning_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://dnywdwysnsqkdkvuuvmy.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRueXdkd3lzbnNxa2RrdnV1dm15Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTgzOTA4MTUsImV4cCI6MjAxMzk2NjgxNX0.zkMINnmfZPGzt5noMsIZAlxk-AmOPgfqPCrw7ADPj04',
  );
  runApp(const ProviderScope(child: MyApp()));
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
