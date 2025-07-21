part of 'device_info_bloc.dart';



@freezed
sealed class DeviceInfoEvent with _$DeviceInfoEvent {
  const factory DeviceInfoEvent.load() = LoadDeviceInfo;
  const factory DeviceInfoEvent.refresh() = RefreshDeviceInfo;
  const factory DeviceInfoEvent.refreshBatteryOnly() = RefreshBatteryOnly;
}
