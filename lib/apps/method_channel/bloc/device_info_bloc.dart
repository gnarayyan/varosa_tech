import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/device_info.dart';
import '../services/device_info_service.dart';

part 'device_info_event.dart';
part 'device_info_state.dart';
part 'device_info_bloc.freezed.dart';

class DeviceInfoBloc extends Bloc<DeviceInfoEvent, DeviceInfoState> {
  final DeviceInfoService _deviceInfoService;

  DeviceInfoBloc(this._deviceInfoService)
    : super(const DeviceInfoState.initial()) {
    on<LoadDeviceInfo>(_onLoad);
    on<RefreshDeviceInfo>(_onRefresh);
    on<RefreshBatteryOnly>(_onBatteryOnly);
  }

  Future<void> _onLoad(
    LoadDeviceInfo event,
    Emitter<DeviceInfoState> emit,
  ) async {
    emit(const DeviceInfoState.loading());
    try {
      final deviceInfo = await _deviceInfoService.getDeviceInfo();
      emit(DeviceInfoState.loaded(deviceInfo));
    } catch (e) {
      emit(DeviceInfoState.error(e.toString()));
    }
  }

  Future<void> _onRefresh(
    RefreshDeviceInfo event,
    Emitter<DeviceInfoState> emit,
  ) async {
    emit(const DeviceInfoState.loading());
    try {
      final deviceInfo = await _deviceInfoService.getDeviceInfo();
      emit(DeviceInfoState.loaded(deviceInfo));
    } catch (e) {
      emit(DeviceInfoState.error(e.toString()));
    }
  }

  Future<void> _onBatteryOnly(
    RefreshBatteryOnly event,
    Emitter<DeviceInfoState> emit,
  ) async {
    final currentState = state;
    if (currentState is DeviceInfoLoaded) {
      emit(DeviceInfoState.batteryRefreshing(currentState.deviceInfo));
      try {
        final newBattery = await _deviceInfoService.getBatteryLevel();
        final updated = currentState.deviceInfo.copyWith(
          batteryLevel: newBattery,
          systemTime: DateTime.now(),
        );
        emit(DeviceInfoState.loaded(updated));
      } catch (e) {
        emit(DeviceInfoState.error(e.toString()));
      }
    }
  }
}
