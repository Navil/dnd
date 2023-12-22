import 'dart:io';

import 'package:emulators/emulators.dart';

Future<void> main() async {
  List<String> emulatorIds = [
    'Pixel_6a_API_33',
    //'Galaxy_Nexus_API_33',
    //'iPhone 8 Plus',
    //'iPad Pro (12.9-inch) (6th generation)'
  ];
  await runFlutterScreenshotTests(emulatorIds);
}

Future<void> runFlutterIntegrationTests(
    String deviceId, String deviceName) async {
  const String integrationTestDriver = 'integration_test/test_driver.dart';
  const String integrationTestTarget =
      'integration_test/emulators/screenshot_test.dart';

  final result = await Process.run('flutter', [
    'drive',
    '-d',
    deviceId,
    '--driver=$integrationTestDriver',
    '--target=$integrationTestTarget',
  ], environment: {
    'DEVICE_NAME': deviceName
  });
  print(result.stderr);
  print(result.stdout);
}

Future<void> runFlutterScreenshotTests(List<String> emulatorIds) async {
  final emulators = await Emulators.build();

  final configs = [
    {'locale': 'en-US'},
  ];

  await emulators.forEach(emulatorIds)((device) async {
    for (final c in configs) {
      DeviceState state = device.state;
      print("Starting " + state.id + ": " + state.name);
      await runFlutterIntegrationTests(state.id, state.name);

      await emulators.drive(
          device, 'integration_test/emulators/screenshot.dart',
          config: c);
      print(6);
    }
  });
}
