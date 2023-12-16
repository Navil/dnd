import 'dart:async';

import 'package:dnd/main.dart' as app;
import 'package:dnd/pages/login.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  testWidgets('screenshot', (WidgetTester tester) async {
    // Build the app.
    app.main();

    final loginButton = find.byKey(const ValueKey(LoginPage.loginButton));

    await pumpUntilFound(tester, loginButton);

    final registerButton = find.byKey(const ValueKey(LoginPage.registerButton));
    final emailInput = find.byKey(const ValueKey(LoginPage.emailInput));
    final passwordInput = find.byKey(const ValueKey(LoginPage.passwordInput));

    await tester.enterText(emailInput,
        "screenshots_${DateTime.now().millisecondsSinceEpoch}@dnd.com");
    await tester.enterText(passwordInput, "123456");

    await tester.tap(registerButton);

    // This is required prior to taking the screenshot (Android only).
    await binding.convertFlutterSurfaceToImage();

    await binding.takeScreenshot('screenshot-1');
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
