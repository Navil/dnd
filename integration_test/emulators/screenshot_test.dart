import 'package:dnd/pages/edit_profile.dart';
import 'package:dnd/pages/login.dart';
import 'package:dnd/pages/tabs/find_group/find_group.dart';
import 'package:emulators/emulators.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_test/flutter_test.dart' hide find;
import 'package:integration_test/integration_test.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  const androidScreenshotPath = 'screenshots/store/android';
  const iosScreenshotPath = 'screenshots/store/ios';

  final driver = await FlutterDriver.connect(dartVmServiceUrl: "localhost");
  final emulators = await Emulators.build();
  final screenshot = emulators.screenshotHelper(
    androidPath: androidScreenshotPath,
    iosPath: iosScreenshotPath,
  );

  setUpAll(() async {
    await screenshot.cleanStatusBar();
    await driver.waitUntilFirstFrameRasterized();
  });

  tearDownAll(() async {
    await driver.close();
  });

  takeScreenshot(identifier) async {
    await driver.waitUntilNoTransientCallbacks();
    await screenshot.capture(identifier);
  }

  group('end-to-end test', () {
    test('Navigate and Screenshot', () async {
      //REGISTER
      final loginButton =
          find.byValueKey(const ValueKey(LoginPage.loginButton));

      await driver.waitFor(loginButton);

      final registerButton =
          find.byValueKey(const ValueKey(LoginPage.registerButton));
      final emailInput = find.byValueKey(const ValueKey(LoginPage.emailInput));
      final passwordInput =
          find.byValueKey(const ValueKey(LoginPage.passwordInput));
      await driver.tap(emailInput);
      await driver.enterText(
          "screenshots_${DateTime.now().millisecondsSinceEpoch}@dnd.com");
      await driver.tap(passwordInput);
      await driver.enterText("123456");

      await driver.tap(registerButton);

      //CREATE PROFILE
      final firstnameInput =
          find.byValueKey(const ValueKey(EditProfilePage.firstnameInput));
      final submitButton =
          find.byValueKey(const ValueKey(EditProfilePage.submitButton));
      await driver.waitFor(firstnameInput);
      await driver.tap(firstnameInput);
      await driver.enterText("Martin");
      await driver.tap(submitButton);

      //FIND GROUPS
      final findGroupsButton =
          find.byValueKey(const ValueKey(FindGroupTab.searchButton));
      await driver.waitFor(findGroupsButton);

      await takeScreenshot('1_favorites');
    });
  });
}
