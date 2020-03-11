import 'dart:io';

import 'package:device_info/device_info.dart';

class DeviceIdentityInfo {
  static Future<DeviceIdentityInfo> gather() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    try {
      if (Platform.isAndroid) {
        AndroidDeviceInfo info = await deviceInfo.androidInfo;

        return DeviceIdentityInfo(
          deviceName: info.model,
          deviceModel: info.model,
          deviceSystem: info.version.baseOS,
          deviceVersion: info.version.release,
          deviceIdentifier: info.androidId,
          isPhysicalDevice: info.isPhysicalDevice,
        );
      } else if (Platform.isIOS) {
        IosDeviceInfo info = await deviceInfo.iosInfo;

        return DeviceIdentityInfo(
          deviceName: info.name,
          deviceModel: info.model,
          deviceSystem: info.systemName,
          deviceVersion: info.systemVersion,
          deviceIdentifier: info.identifierForVendor,
          isPhysicalDevice: info.isPhysicalDevice,
        );
      }
    } on Exception {
      return null;
    }

    return null;
  }

  final String deviceName;
  final String deviceModel;
  final String deviceSystem;
  final String deviceVersion;
  final String deviceIdentifier;

  final bool isPhysicalDevice;

  DeviceIdentityInfo({
    this.deviceName,
    this.deviceModel,
    this.deviceSystem,
    this.deviceVersion,
    this.deviceIdentifier,
    this.isPhysicalDevice,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'deviceName': this.deviceName,
      'deviceModel': this.deviceModel,
      'deviceSystem': this.deviceSystem,
      'deviceVersion': this.deviceVersion,
      'deviceIdentifier': this.deviceIdentifier,
      'isPhysicalDevice': this.isPhysicalDevice,
    };
    return map;
  }

  String toString() {
    return this.toMap().toString();
  }
}
