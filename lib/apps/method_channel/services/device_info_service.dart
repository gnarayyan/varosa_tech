import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/device_info.dart';

class DeviceInfoService {
  static const MethodChannel _channel = MethodChannel(
    'varosa_tech/device_info',
  );

   Future<DeviceInfo> getDeviceInfo() async {
    try {
      final String result = await _channel.invokeMethod('getDeviceInfo');
      final Map<String, dynamic> deviceData = json.decode(result);
      return DeviceInfo.fromJson(deviceData);
    } on PlatformException catch (e) {
      throw Exception('Failed to get device info: ${e.message}');
    } catch (e) {
      throw Exception('Failed to parse device info: $e');
    }
  }

   Future<int> getBatteryLevel() async {
    try {
      final int result = await _channel.invokeMethod('getBatteryLevel');
      return result;
    } on PlatformException catch (e) {
      throw Exception('Failed to get battery level: ${e.message}');
    }
  }
}
