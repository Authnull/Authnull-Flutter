import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:authnull/authnull.dart';

void main() {
  const MethodChannel channel = MethodChannel('authnull');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await Authnull.platformVersion, '42');
  });
}
