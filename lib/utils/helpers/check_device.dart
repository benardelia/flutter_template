import 'package:safe_device/safe_device.dart';

class DeviceChecker {
  static Future<bool> isJailBroken() async {
    return await SafeDevice.isJailBroken;
  }

  static Future<bool> isRealDevice() async {
    return await SafeDevice.isRealDevice;
  }

  static Future<bool> isMockLocation() async {
    return await SafeDevice.isMockLocation;
  }

// For Android only
  static Future<bool> isOnExternalStorage() async {
    return await SafeDevice.isOnExternalStorage;
  }

// check if violet any of above
  static Future<bool> isSafeDevice() async {
    return await SafeDevice.isSafeDevice;
  }

// For Android only
  static Future<bool> isDevelopmentModeEnable() async {
    return await SafeDevice.isDevelopmentModeEnable;
  }
}
