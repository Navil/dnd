import 'dart:async';

import 'package:dnd/pages/edit_profile.dart';
import 'package:dnd/pages/login.dart';
import 'package:dnd/pages/tabs/find_group/find_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:dnd/main.dart' as app;

//Run with: flutter drive --driver=integration_test/test_driver.dart --target=integration_test/screenshots.dart --dart-define-from-file=api-keys.json
void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('screenshot', (WidgetTester tester) async {
    // Build the app.
    app.main();

    // This is required prior to taking the screenshot (Android only).
    await binding.convertFlutterSurfaceToImage();

    //REGISTER
    final loginButton = find.byKey(const ValueKey(LoginPage.loginButton));

    await pumpUntilFound(tester, loginButton);

    final registerButton = find.byKey(const ValueKey(LoginPage.registerButton));
    final emailInput = find.byKey(const ValueKey(LoginPage.emailInput));
    final passwordInput = find.byKey(const ValueKey(LoginPage.passwordInput));
    await tester.enterText(emailInput,
        "screenshots_${DateTime.now().millisecondsSinceEpoch}@dnd.com");
    await tester.enterText(passwordInput, "123456");
    await binding.takeScreenshot('2_login');

    await tester.tap(registerButton);

    //CREATE PROFILE
    final firstnameInput =
        find.byKey(const ValueKey(EditProfilePage.firstnameInput));
    final submitButton =
        find.byKey(const ValueKey(EditProfilePage.submitButton));

    await pumpUntilFound(tester, firstnameInput);
    await tester.enterText(firstnameInput, "Martin");
    await tester.tap(submitButton);

    //FIND GROUPS
    final findGroupsButton =
        find.byKey(const ValueKey(FindGroupTab.searchButton));
    await pumpUntilFound(tester, findGroupsButton);



    await binding.takeScreenshot('1_favorites');
  });
}

Future<void> pumpUntilFound(
  WidgetTester tester,
  Finder finder, {
  Duration timeout = const Duration(seconds: 10),
}) async {
  bool timerDone = false;
  final timer = Timer(timeout, () => timerDone = true);
  while (timerDone != true) {
    await tester.pump();

    final found = tester.any(finder);
    if (found) {
      timerDone = true;
    }
  }
  timer.cancel();
}
