// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeviceInfoImpl _$$DeviceInfoImplFromJson(Map<String, dynamic> json) =>
    _$DeviceInfoImpl(
      batteryLevel: (json['batteryLevel'] as num).toInt(),
      deviceModel: json['deviceModel'] as String,
      isCharging: json['isCharging'] as bool,
      systemTime: DateTime.parse(json['systemTime'] as String),
    );

Map<String, dynamic> _$$DeviceInfoImplToJson(_$DeviceInfoImpl instance) =>
    <String, dynamic>{
      'batteryLevel': instance.batteryLevel,
      'deviceModel': instance.deviceModel,
      'isCharging': instance.isCharging,
      'systemTime': instance.systemTime.toIso8601String(),
    };
