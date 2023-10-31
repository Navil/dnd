import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const int themeLight = 1;
  static const int themeDark = 2;

  static const primaryColor = Color.fromARGB(255, 146, 23, 23);
  static final secondaryColor = primaryColor.withOpacity(0.7);

  //Change Font Family Default
  static const String fontPath = "Poppins";
  static const fontFamily = GoogleFonts.getFont;

  AppTheme._();

  static CustomAppTheme getCustomAppTheme(int themeMode) {
    if (themeMode == themeLight) {
      return lightCustomAppTheme;
    } else if (themeMode == themeDark) {
      return darkCustomAppTheme;
    }
    return darkCustomAppTheme;
  }

  static FontWeight _getFontWeight(int weight) {
    switch (weight) {
      case 100:
        return FontWeight.w100;
      case 200:
        return FontWeight.w200;
      case 300:
        return FontWeight.w300;
      case 400:
        return FontWeight.w300;
      case 500:
        return FontWeight.w400;
      case 600:
        return FontWeight.w500;
      case 700:
        return FontWeight.w600;
      case 800:
        return FontWeight.w700;
      case 900:
        return FontWeight.w900;
    }
    return FontWeight.w400;
  }

  static TextStyle getTextStyle(TextStyle textStyle,
      {int fontWeight = 500,
      bool muted = false,
      bool xMuted = false,
      double letterSpacing = 0.15,
      required Color color,
      TextDecoration decoration = TextDecoration.none,
      required double height,
      double wordSpacing = 0,
      required double fontSize}) {
    double finalFontSize = fontSize;

    Color? finalColor = xMuted
        ? textStyle.color!.withAlpha(160)
        : (muted ? textStyle.color?.withAlpha(200) : textStyle.color);

    return fontFamily(fontPath,
        fontSize: finalFontSize,
        fontWeight: _getFontWeight(fontWeight),
        letterSpacing: letterSpacing,
        color: finalColor,
        decoration: decoration,
        height: height,
        wordSpacing: wordSpacing);
  }

  static final TextTheme lightTextTheme = TextTheme(
    titleSmall: fontFamily(fontPath,
        textStyle: const TextStyle(
            fontSize: 14, color: primaryColor, wordSpacing: 0.1)),
    titleMedium: fontFamily(fontPath,
        textStyle: const TextStyle(
          fontSize: 16,
          color: Colors.black,
          wordSpacing: 0.15,
        )),
    titleLarge: fontFamily(fontPath,
        textStyle: const TextStyle(
            fontSize: 22,
            color: primaryColor,
            wordSpacing: 0,
            fontWeight: FontWeight.normal)),
    bodySmall: fontFamily(fontPath,
        textStyle: const TextStyle(
            fontSize: 12, color: Colors.black, wordSpacing: 0.4)),
    bodyMedium: fontFamily(fontPath,
        textStyle: const TextStyle(
            fontSize: 14, color: Colors.black, wordSpacing: 0.25)),
    bodyLarge: fontFamily(fontPath,
        textStyle: const TextStyle(
            fontSize: 16,
            color: Colors.black,
            wordSpacing: 0.15,
            fontWeight: FontWeight.w500)),
  );

  static final TextTheme lightAppBarTextTheme = lightTextTheme;

  static final TextTheme darkAppBarTextTheme = lightTextTheme;

  static final TextTheme darkTextTheme = lightTextTheme;

  static final ThemeData lightTheme = ThemeData(
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            side: const BorderSide(color: primaryColor))),
    badgeTheme: BadgeThemeData(
      backgroundColor: primaryColor,
      textColor: Colors.white,
      largeSize: 20,
      alignment: const AlignmentDirectional(56, -4),
      textStyle: lightTextTheme.bodySmall,
      padding: const EdgeInsets.symmetric(horizontal: 6),
    ),
    tooltipTheme: const TooltipThemeData(
      margin: EdgeInsets.all(16),
      showDuration: Duration(seconds: 5),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
        selectionColor: Colors.orange, selectionHandleColor: Colors.black),
    scrollbarTheme: ScrollbarThemeData(
        thumbVisibility: MaterialStateProperty.all(true),
        trackVisibility: MaterialStateProperty.all(true),
        radius: const Radius.circular(18),
        thumbColor: MaterialStateProperty.all(primaryColor)),
    snackBarTheme: SnackBarThemeData(
      actionTextColor: Colors.white,
      behavior: SnackBarBehavior.floating,
      backgroundColor: primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            side: const BorderSide(color: primaryColor))),
    radioTheme:
        RadioThemeData(fillColor: MaterialStateProperty.all(primaryColor)),
    bannerTheme: MaterialBannerThemeData(
        backgroundColor: secondaryColor,
        contentTextStyle:
            lightAppBarTextTheme.bodySmall!.copyWith(color: Colors.white)),
    unselectedWidgetColor: primaryColor,
    checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (!states.contains(MaterialState.selected)) {
            return Colors.white;
          }
          return null;
        }),
        side: const BorderSide(color: primaryColor, width: 1),
        checkColor: const MaterialStatePropertyAll(Colors.white)),
    brightness: Brightness.light,
    primaryColor: primaryColor,
    canvasColor: const Color(0xfff2f3f7),
    scaffoldBackgroundColor: const Color(0xffffffff),
    appBarTheme: AppBarTheme(
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarColor: primaryColor,
          systemNavigationBarColor: primaryColor,
          systemNavigationBarDividerColor: primaryColor),
      actionsIconTheme: const IconThemeData(
        color: primaryColor,
      ),
      color: const Color(0xffffffff),
      iconTheme: const IconThemeData(color: primaryColor, size: 26),
      toolbarTextStyle: lightAppBarTextTheme.bodyMedium,
      titleTextStyle: lightAppBarTextTheme.titleMedium,
    ),
    dialogTheme: DialogTheme(
      iconColor: primaryColor,
      elevation: 10,
      titleTextStyle: lightTextTheme.bodyLarge,
      contentTextStyle: lightTextTheme.bodySmall,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
    ),
    navigationRailTheme: const NavigationRailThemeData(
        selectedIconTheme:
            IconThemeData(color: primaryColor, opacity: 1, size: 24),
        unselectedIconTheme:
            IconThemeData(color: Color(0xff495057), opacity: 1, size: 24),
        backgroundColor: Color(0xffffffff),
        elevation: 3,
        selectedLabelTextStyle: TextStyle(color: primaryColor),
        unselectedLabelTextStyle: TextStyle(color: Color(0xff495057))),
    cardTheme: const CardTheme(
      color: Colors.white,
      shadowColor: Color(0xff000000),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      elevation: 8,
      margin: EdgeInsets.all(0),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      isDense: true,
      hintStyle: TextStyle(fontSize: 15, color: Color(0xaa495057)),
      contentPadding: EdgeInsets.all(10),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(width: 1, color: primaryColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(width: 1, color: Colors.black54),
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.black54)),
    ),
    splashColor: Colors.white.withAlpha(100),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    textTheme: lightTextTheme,
    indicatorColor: Colors.white,
    disabledColor: Colors.grey,
    highlightColor: Colors.white,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
        splashColor: Colors.white.withAlpha(100),
        highlightElevation: 8,
        elevation: 4,
        focusColor: primaryColor,
        hoverColor: primaryColor,
        foregroundColor: Colors.white),
    dividerColor: const Color(0xffd1d1d1),
    cardColor: Colors.white,
    popupMenuTheme: PopupMenuThemeData(
      color: const Color(0xffffffff),
      textStyle: lightTextTheme.bodyMedium
          ?.merge(const TextStyle(color: Color(0xff495057))),
    ),
    bottomAppBarTheme:
        const BottomAppBarTheme(color: Color(0xffffffff), elevation: 2),
    tabBarTheme: const TabBarTheme(
      unselectedLabelColor: Color(0xff495057),
      labelColor: primaryColor,
      indicatorSize: TabBarIndicatorSize.label,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: primaryColor, width: 2.0),
      ),
    ),
    sliderTheme: SliderThemeData(
      activeTrackColor: primaryColor,
      inactiveTrackColor: primaryColor.withAlpha(140),
      trackShape: const RoundedRectSliderTrackShape(),
      trackHeight: 4.0,
      thumbColor: primaryColor,
      thumbShape:
          const RoundSliderThumbShape(enabledThumbRadius: 6.0, elevation: 2),
      overlayShape: const RoundSliderOverlayShape(overlayRadius: 12.0),
      tickMarkShape: const RoundSliderTickMarkShape(),
      inactiveTickMarkColor: Colors.red[100],
      valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
      valueIndicatorTextStyle: const TextStyle(
        color: Colors.white,
      ),
    ),
    colorScheme: ColorScheme.light(
            primary: primaryColor,
            onPrimary: Colors.white,
            secondary: secondaryColor,
            onSecondary: Colors.white,
            surface: const Color(0xffe2e7f1),
            background: const Color(0xfff3f4f7),
            onBackground: const Color(0xff495057))
        .copyWith(secondary: primaryColor)
        .copyWith(background: Colors.white)
        .copyWith(error: const Color(0xfff0323c)),
  );

  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.light,
      canvasColor: Colors.transparent,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: const Color(0xff464c52),
      appBarTheme: AppBarTheme(
        actionsIconTheme: const IconThemeData(
          color: Color(0xffffffff),
        ),
        color: const Color(0xff2e343b),
        iconTheme: const IconThemeData(color: Color(0xffffffff), size: 24),
        toolbarTextStyle: darkAppBarTextTheme.bodyMedium,
        titleTextStyle: darkAppBarTextTheme.bodySmall,
      ),
      cardTheme: const CardTheme(
        color: Color(0xff37404a),
        shadowColor: Color(0xff000000),
        elevation: 1,
        margin: EdgeInsets.all(0),
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      textTheme: darkTextTheme,
      indicatorColor: Colors.white,
      disabledColor: Colors.grey,
      highlightColor: Colors.white,
      inputDecorationTheme: const InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: primaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.white70),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1, color: Colors.white70)),
      ),
      dividerColor: const Color(0xffd1d1d1),
      cardColor: const Color(0xff282a2b),
      splashColor: Colors.white.withAlpha(100),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: primaryColor,
          splashColor: Colors.white.withAlpha(100),
          highlightElevation: 8,
          elevation: 4,
          focusColor: primaryColor,
          hoverColor: primaryColor,
          foregroundColor: Colors.white),
      popupMenuTheme: PopupMenuThemeData(
        color: const Color(0xff37404a),
        textStyle: lightTextTheme.bodyMedium
            ?.merge(const TextStyle(color: Color(0xffffffff))),
      ),
      bottomAppBarTheme:
          const BottomAppBarTheme(color: Color(0xff464c52), elevation: 2),
      tabBarTheme: const TabBarTheme(
        unselectedLabelColor: Color(0xff495057),
        labelColor: primaryColor,
        indicatorSize: TabBarIndicatorSize.label,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: primaryColor, width: 2.0),
        ),
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: primaryColor,
        inactiveTrackColor: primaryColor.withAlpha(100),
        trackShape: const RoundedRectSliderTrackShape(),
        trackHeight: 4.0,
        thumbColor: primaryColor,
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10.0),
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 24.0),
        tickMarkShape: const RoundSliderTickMarkShape(),
        inactiveTickMarkColor: Colors.red[100],
        valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
        valueIndicatorTextStyle: const TextStyle(
          color: Colors.white,
        ),
      ),
      cupertinoOverrideTheme: const CupertinoThemeData(),
      colorScheme: ColorScheme.light(
        primary: primaryColor,
        secondary: secondaryColor,
        background: const Color(0xff343a40),
        onPrimary: Colors.white,
        onBackground: Colors.white,
        onSecondary: Colors.white,
        surface: const Color(0xff585e63),
      )
          .copyWith(secondary: primaryColor)
          .copyWith(background: const Color(0xff464c52))
          .copyWith(error: Colors.orange));

  static ThemeData getThemeFromThemeMode(int themeMode) {
    if (themeMode == themeLight) {
      return lightTheme;
    } else if (themeMode == themeDark) {
      return darkTheme;
    }
    return lightTheme;
  }

  static NavigationBarTheme getNavigationThemeFromMode(int themeMode) {
    NavigationBarTheme navigationBarTheme = NavigationBarTheme();
    if (themeMode == themeLight) {
      navigationBarTheme.backgroundColor = Colors.white;
      navigationBarTheme.selectedItemColor = primaryColor;
      navigationBarTheme.unselectedItemColor = const Color(0xff495057);
      navigationBarTheme.selectedOverlayColor = const Color(0x383d63ff);
    } else if (themeMode == themeDark) {
      navigationBarTheme.backgroundColor = const Color(0xff37404a);
      navigationBarTheme.selectedItemColor = const Color(0xff37404a);
      navigationBarTheme.unselectedItemColor = const Color(0xffd1d1d1);
      navigationBarTheme.selectedOverlayColor = const Color(0xffffffff);
    }
    return navigationBarTheme;
  }

  static final CustomAppTheme lightCustomAppTheme = CustomAppTheme(
      bgLayer1: const Color(0xffffffff),
      bgLayer2: const Color(0xfff9f9f9),
      bgLayer3: const Color(0xffe8ecf4),
      bgLayer4: const Color(0xffdcdee3),
      disabledColor: Colors.grey,
      onDisabled: const Color(0xffffffff),
      colorInfo: const Color(0xffff784b),
      colorWarning: const Color(0xffffc837),
      colorSuccess: const Color(0xff3cd278),
      shadowColor: const Color(0xffeaeaea),
      onInfo: const Color(0xffffffff),
      onSuccess: const Color(0xffffffff),
      onWarning: const Color(0xffffffff),
      colorError: const Color(0xfff0323c),
      onError: const Color(0xffffffff),
      shimmerBaseColor: const Color(0xFFF5F5F5),
      shimmerHighlightColor: const Color(0xFFE0E0E0));
  static final CustomAppTheme darkCustomAppTheme = CustomAppTheme(
      bgLayer1: const Color(0xff212429),
      bgLayer2: const Color(0xff282930),
      bgLayer3: const Color(0xff303138),
      bgLayer4: const Color(0xff383942),
      disabledColor: Colors.grey,
      onDisabled: const Color(0xff000000),
      colorInfo: const Color(0xffff784b),
      colorWarning: const Color(0xffffc837),
      colorSuccess: const Color(0xff3cd278),
      shadowColor: const Color(0xff1a1a1a),
      onInfo: const Color(0xffffffff),
      onSuccess: const Color(0xffffffff),
      onWarning: const Color(0xffffffff),
      colorError: const Color(0xfff0323c),
      onError: const Color(0xffffffff),
      shimmerBaseColor: const Color(0xFF1a1a1a),
      shimmerHighlightColor: const Color(0xFF454545));
}

class CustomAppTheme {
  static const Color starColor = Color(0xfff9c700);

  final Color bgLayer1,
      bgLayer2,
      bgLayer3,
      bgLayer4,
      disabledColor,
      onDisabled,
      colorInfo,
      colorWarning,
      colorSuccess,
      colorError,
      shadowColor,
      onInfo,
      onWarning,
      onSuccess,
      onError,
      shimmerBaseColor,
      shimmerHighlightColor;

  CustomAppTheme({
    this.bgLayer1 = const Color(0xffffffff),
    this.bgLayer2 = const Color(0xfff8faff),
    this.bgLayer3 = const Color(0xffeef2fa),
    this.bgLayer4 = const Color(0xffdcdee3),
    this.disabledColor = Colors.grey,
    this.onDisabled = const Color(0xffffffff),
    this.colorWarning = const Color(0xffffc837),
    this.colorInfo = const Color(0xffff784b),
    this.colorSuccess = const Color(0xff3cd278),
    this.shadowColor = const Color(0xff1f1f1f),
    this.onInfo = const Color(0xffffffff),
    this.onWarning = const Color(0xffffffff),
    this.onSuccess = const Color(0xffffffff),
    this.colorError = const Color(0xfff0323c),
    this.onError = const Color(0xffffffff),
    this.shimmerBaseColor = const Color(0xffdcc7ff),
    this.shimmerHighlightColor = const Color(0xFFE0E0E0),
  });
}

class NavigationBarTheme {
  late Color backgroundColor,
      selectedItemIconColor,
      selectedItemTextColor,
      selectedItemColor,
      selectedOverlayColor,
      unselectedItemIconColor,
      unselectedItemTextColor,
      unselectedItemColor;
}
