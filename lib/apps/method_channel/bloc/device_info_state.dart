part of 'device_info_bloc.dart';

@freezed
sealed class DeviceInfoState with _$DeviceInfoState {
  const factory DeviceInfoState.initial() = DeviceInfoInitial;
  const factory DeviceInfoState.loading() = DeviceInfoLoading;
  const factory DeviceInfoState.loaded(DeviceInfo deviceInfo) =
      DeviceInfoLoaded;
  const factory DeviceInfoState.batteryRefreshing(DeviceInfo deviceInfo) =
      DeviceInfoBatteryRefreshing;
  const factory DeviceInfoState.error(String message) = DeviceInfoError;
}
