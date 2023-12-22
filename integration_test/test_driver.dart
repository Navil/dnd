import 'dart:io';

import 'package:integration_test/integration_test_driver_extended.dart';

String deviceName = Platform.environment['DEVICE_NAME'] ?? '';
String devicePrefix = deviceName.isEmpty ? '' : '${deviceName}_';

Future<void> main() async {
  await integrationDriver(
    onScreenshot: (String screenshotName, List<int> screenshotBytes,
        [Map<String, Object?>? args]) async {
      final File image =
          await File('screenshots/$devicePrefix$screenshotName.png')
              .create(recursive: true);
      image.writeAsBytesSync(screenshotBytes);
      // Return false if the screenshot is invalid.
      return true;
    },
  );
}
