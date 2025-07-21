// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_info_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DeviceInfoEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function() refresh,
    required TResult Function() refreshBatteryOnly,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function()? refresh,
    TResult? Function()? refreshBatteryOnly,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function()? refresh,
    TResult Function()? refreshBatteryOnly,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadDeviceInfo value) load,
    required TResult Function(RefreshDeviceInfo value) refresh,
    required TResult Function(RefreshBatteryOnly value) refreshBatteryOnly,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadDeviceInfo value)? load,
    TResult? Function(RefreshDeviceInfo value)? refresh,
    TResult? Function(RefreshBatteryOnly value)? refreshBatteryOnly,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadDeviceInfo value)? load,
    TResult Function(RefreshDeviceInfo value)? refresh,
    TResult Function(RefreshBatteryOnly value)? refreshBatteryOnly,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceInfoEventCopyWith<$Res> {
  factory $DeviceInfoEventCopyWith(
    DeviceInfoEvent value,
    $Res Function(DeviceInfoEvent) then,
  ) = _$DeviceInfoEventCopyWithImpl<$Res, DeviceInfoEvent>;
}

/// @nodoc
class _$DeviceInfoEventCopyWithImpl<$Res, $Val extends DeviceInfoEvent>
    implements $DeviceInfoEventCopyWith<$Res> {
  _$DeviceInfoEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeviceInfoEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadDeviceInfoImplCopyWith<$Res> {
  factory _$$LoadDeviceInfoImplCopyWith(
    _$LoadDeviceInfoImpl value,
    $Res Function(_$LoadDeviceInfoImpl) then,
  ) = __$$LoadDeviceInfoImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadDeviceInfoImplCopyWithImpl<$Res>
    extends _$DeviceInfoEventCopyWithImpl<$Res, _$LoadDeviceInfoImpl>
    implements _$$LoadDeviceInfoImplCopyWith<$Res> {
  __$$LoadDeviceInfoImplCopyWithImpl(
    _$LoadDeviceInfoImpl _value,
    $Res Function(_$LoadDeviceInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DeviceInfoEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadDeviceInfoImpl implements LoadDeviceInfo {
  const _$LoadDeviceInfoImpl();

  @override
  String toString() {
    return 'DeviceInfoEvent.load()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadDeviceInfoImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function() refresh,
    required TResult Function() refreshBatteryOnly,
  }) {
    return load();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function()? refresh,
    TResult? Function()? refreshBatteryOnly,
  }) {
    return load?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function()? refresh,
    TResult Function()? refreshBatteryOnly,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadDeviceInfo value) load,
    required TResult Function(RefreshDeviceInfo value) refresh,
    required TResult Function(RefreshBatteryOnly value) refreshBatteryOnly,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadDeviceInfo value)? load,
    TResult? Function(RefreshDeviceInfo value)? refresh,
    TResult? Function(RefreshBatteryOnly value)? refreshBatteryOnly,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadDeviceInfo value)? load,
    TResult Function(RefreshDeviceInfo value)? refresh,
    TResult Function(RefreshBatteryOnly value)? refreshBatteryOnly,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class LoadDeviceInfo implements DeviceInfoEvent {
  const factory LoadDeviceInfo() = _$LoadDeviceInfoImpl;
}

/// @nodoc
abstract class _$$RefreshDeviceInfoImplCopyWith<$Res> {
  factory _$$RefreshDeviceInfoImplCopyWith(
    _$RefreshDeviceInfoImpl value,
    $Res Function(_$RefreshDeviceInfoImpl) then,
  ) = __$$RefreshDeviceInfoImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshDeviceInfoImplCopyWithImpl<$Res>
    extends _$DeviceInfoEventCopyWithImpl<$Res, _$RefreshDeviceInfoImpl>
    implements _$$RefreshDeviceInfoImplCopyWith<$Res> {
  __$$RefreshDeviceInfoImplCopyWithImpl(
    _$RefreshDeviceInfoImpl _value,
    $Res Function(_$RefreshDeviceInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DeviceInfoEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RefreshDeviceInfoImpl implements RefreshDeviceInfo {
  const _$RefreshDeviceInfoImpl();

  @override
  String toString() {
    return 'DeviceInfoEvent.refresh()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshDeviceInfoImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function() refresh,
    required TResult Function() refreshBatteryOnly,
  }) {
    return refresh();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function()? refresh,
    TResult? Function()? refreshBatteryOnly,
  }) {
    return refresh?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function()? refresh,
    TResult Function()? refreshBatteryOnly,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadDeviceInfo value) load,
    required TResult Function(RefreshDeviceInfo value) refresh,
    required TResult Function(RefreshBatteryOnly value) refreshBatteryOnly,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadDeviceInfo value)? load,
    TResult? Function(RefreshDeviceInfo value)? refresh,
    TResult? Function(RefreshBatteryOnly value)? refreshBatteryOnly,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadDeviceInfo value)? load,
    TResult Function(RefreshDeviceInfo value)? refresh,
    TResult Function(RefreshBatteryOnly value)? refreshBatteryOnly,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class RefreshDeviceInfo implements DeviceInfoEvent {
  const factory RefreshDeviceInfo() = _$RefreshDeviceInfoImpl;
}

/// @nodoc
abstract class _$$RefreshBatteryOnlyImplCopyWith<$Res> {
  factory _$$RefreshBatteryOnlyImplCopyWith(
    _$RefreshBatteryOnlyImpl value,
    $Res Function(_$RefreshBatteryOnlyImpl) then,
  ) = __$$RefreshBatteryOnlyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshBatteryOnlyImplCopyWithImpl<$Res>
    extends _$DeviceInfoEventCopyWithImpl<$Res, _$RefreshBatteryOnlyImpl>
    implements _$$RefreshBatteryOnlyImplCopyWith<$Res> {
  __$$RefreshBatteryOnlyImplCopyWithImpl(
    _$RefreshBatteryOnlyImpl _value,
    $Res Function(_$RefreshBatteryOnlyImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DeviceInfoEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RefreshBatteryOnlyImpl implements RefreshBatteryOnly {
  const _$RefreshBatteryOnlyImpl();

  @override
  String toString() {
    return 'DeviceInfoEvent.refreshBatteryOnly()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshBatteryOnlyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function() refresh,
    required TResult Function() refreshBatteryOnly,
  }) {
    return refreshBatteryOnly();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function()? refresh,
    TResult? Function()? refreshBatteryOnly,
  }) {
    return refreshBatteryOnly?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function()? refresh,
    TResult Function()? refreshBatteryOnly,
    required TResult orElse(),
  }) {
    if (refreshBatteryOnly != null) {
      return refreshBatteryOnly();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadDeviceInfo value) load,
    required TResult Function(RefreshDeviceInfo value) refresh,
    required TResult Function(RefreshBatteryOnly value) refreshBatteryOnly,
  }) {
    return refreshBatteryOnly(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadDeviceInfo value)? load,
    TResult? Function(RefreshDeviceInfo value)? refresh,
    TResult? Function(RefreshBatteryOnly value)? refreshBatteryOnly,
  }) {
    return refreshBatteryOnly?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadDeviceInfo value)? load,
    TResult Function(RefreshDeviceInfo value)? refresh,
    TResult Function(RefreshBatteryOnly value)? refreshBatteryOnly,
    required TResult orElse(),
  }) {
    if (refreshBatteryOnly != null) {
      return refreshBatteryOnly(this);
    }
    return orElse();
  }
}

abstract class RefreshBatteryOnly implements DeviceInfoEvent {
  const factory RefreshBatteryOnly() = _$RefreshBatteryOnlyImpl;
}

/// @nodoc
mixin _$DeviceInfoState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(DeviceInfo deviceInfo) loaded,
    required TResult Function(DeviceInfo deviceInfo) batteryRefreshing,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(DeviceInfo deviceInfo)? loaded,
    TResult? Function(DeviceInfo deviceInfo)? batteryRefreshing,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(DeviceInfo deviceInfo)? loaded,
    TResult Function(DeviceInfo deviceInfo)? batteryRefreshing,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceInfoInitial value) initial,
    required TResult Function(DeviceInfoLoading value) loading,
    required TResult Function(DeviceInfoLoaded value) loaded,
    required TResult Function(DeviceInfoBatteryRefreshing value)
    batteryRefreshing,
    required TResult Function(DeviceInfoError value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceInfoInitial value)? initial,
    TResult? Function(DeviceInfoLoading value)? loading,
    TResult? Function(DeviceInfoLoaded value)? loaded,
    TResult? Function(DeviceInfoBatteryRefreshing value)? batteryRefreshing,
    TResult? Function(DeviceInfoError value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceInfoInitial value)? initial,
    TResult Function(DeviceInfoLoading value)? loading,
    TResult Function(DeviceInfoLoaded value)? loaded,
    TResult Function(DeviceInfoBatteryRefreshing value)? batteryRefreshing,
    TResult Function(DeviceInfoError value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceInfoStateCopyWith<$Res> {
  factory $DeviceInfoStateCopyWith(
    DeviceInfoState value,
    $Res Function(DeviceInfoState) then,
  ) = _$DeviceInfoStateCopyWithImpl<$Res, DeviceInfoState>;
}

/// @nodoc
class _$DeviceInfoStateCopyWithImpl<$Res, $Val extends DeviceInfoState>
    implements $DeviceInfoStateCopyWith<$Res> {
  _$DeviceInfoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeviceInfoState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$DeviceInfoInitialImplCopyWith<$Res> {
  factory _$$DeviceInfoInitialImplCopyWith(
    _$DeviceInfoInitialImpl value,
    $Res Function(_$DeviceInfoInitialImpl) then,
  ) = __$$DeviceInfoInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeviceInfoInitialImplCopyWithImpl<$Res>
    extends _$DeviceInfoStateCopyWithImpl<$Res, _$DeviceInfoInitialImpl>
    implements _$$DeviceInfoInitialImplCopyWith<$Res> {
  __$$DeviceInfoInitialImplCopyWithImpl(
    _$DeviceInfoInitialImpl _value,
    $Res Function(_$DeviceInfoInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DeviceInfoState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DeviceInfoInitialImpl implements DeviceInfoInitial {
  const _$DeviceInfoInitialImpl();

  @override
  String toString() {
    return 'DeviceInfoState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DeviceInfoInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(DeviceInfo deviceInfo) loaded,
    required TResult Function(DeviceInfo deviceInfo) batteryRefreshing,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(DeviceInfo deviceInfo)? loaded,
    TResult? Function(DeviceInfo deviceInfo)? batteryRefreshing,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(DeviceInfo deviceInfo)? loaded,
    TResult Function(DeviceInfo deviceInfo)? batteryRefreshing,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceInfoInitial value) initial,
    required TResult Function(DeviceInfoLoading value) loading,
    required TResult Function(DeviceInfoLoaded value) loaded,
    required TResult Function(DeviceInfoBatteryRefreshing value)
    batteryRefreshing,
    required TResult Function(DeviceInfoError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceInfoInitial value)? initial,
    TResult? Function(DeviceInfoLoading value)? loading,
    TResult? Function(DeviceInfoLoaded value)? loaded,
    TResult? Function(DeviceInfoBatteryRefreshing value)? batteryRefreshing,
    TResult? Function(DeviceInfoError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceInfoInitial value)? initial,
    TResult Function(DeviceInfoLoading value)? loading,
    TResult Function(DeviceInfoLoaded value)? loaded,
    TResult Function(DeviceInfoBatteryRefreshing value)? batteryRefreshing,
    TResult Function(DeviceInfoError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class DeviceInfoInitial implements DeviceInfoState {
  const factory DeviceInfoInitial() = _$DeviceInfoInitialImpl;
}

/// @nodoc
abstract class _$$DeviceInfoLoadingImplCopyWith<$Res> {
  factory _$$DeviceInfoLoadingImplCopyWith(
    _$DeviceInfoLoadingImpl value,
    $Res Function(_$DeviceInfoLoadingImpl) then,
  ) = __$$DeviceInfoLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeviceInfoLoadingImplCopyWithImpl<$Res>
    extends _$DeviceInfoStateCopyWithImpl<$Res, _$DeviceInfoLoadingImpl>
    implements _$$DeviceInfoLoadingImplCopyWith<$Res> {
  __$$DeviceInfoLoadingImplCopyWithImpl(
    _$DeviceInfoLoadingImpl _value,
    $Res Function(_$DeviceInfoLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DeviceInfoState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DeviceInfoLoadingImpl implements DeviceInfoLoading {
  const _$DeviceInfoLoadingImpl();

  @override
  String toString() {
    return 'DeviceInfoState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DeviceInfoLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(DeviceInfo deviceInfo) loaded,
    required TResult Function(DeviceInfo deviceInfo) batteryRefreshing,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(DeviceInfo deviceInfo)? loaded,
    TResult? Function(DeviceInfo deviceInfo)? batteryRefreshing,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(DeviceInfo deviceInfo)? loaded,
    TResult Function(DeviceInfo deviceInfo)? batteryRefreshing,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceInfoInitial value) initial,
    required TResult Function(DeviceInfoLoading value) loading,
    required TResult Function(DeviceInfoLoaded value) loaded,
    required TResult Function(DeviceInfoBatteryRefreshing value)
    batteryRefreshing,
    required TResult Function(DeviceInfoError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceInfoInitial value)? initial,
    TResult? Function(DeviceInfoLoading value)? loading,
    TResult? Function(DeviceInfoLoaded value)? loaded,
    TResult? Function(DeviceInfoBatteryRefreshing value)? batteryRefreshing,
    TResult? Function(DeviceInfoError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceInfoInitial value)? initial,
    TResult Function(DeviceInfoLoading value)? loading,
    TResult Function(DeviceInfoLoaded value)? loaded,
    TResult Function(DeviceInfoBatteryRefreshing value)? batteryRefreshing,
    TResult Function(DeviceInfoError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class DeviceInfoLoading implements DeviceInfoState {
  const factory DeviceInfoLoading() = _$DeviceInfoLoadingImpl;
}

/// @nodoc
abstract class _$$DeviceInfoLoadedImplCopyWith<$Res> {
  factory _$$DeviceInfoLoadedImplCopyWith(
    _$DeviceInfoLoadedImpl value,
    $Res Function(_$DeviceInfoLoadedImpl) then,
  ) = __$$DeviceInfoLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DeviceInfo deviceInfo});

  $DeviceInfoCopyWith<$Res> get deviceInfo;
}

/// @nodoc
class __$$DeviceInfoLoadedImplCopyWithImpl<$Res>
    extends _$DeviceInfoStateCopyWithImpl<$Res, _$DeviceInfoLoadedImpl>
    implements _$$DeviceInfoLoadedImplCopyWith<$Res> {
  __$$DeviceInfoLoadedImplCopyWithImpl(
    _$DeviceInfoLoadedImpl _value,
    $Res Function(_$DeviceInfoLoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DeviceInfoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? deviceInfo = null}) {
    return _then(
      _$DeviceInfoLoadedImpl(
        null == deviceInfo
            ? _value.deviceInfo
            : deviceInfo // ignore: cast_nullable_to_non_nullable
                  as DeviceInfo,
      ),
    );
  }

  /// Create a copy of DeviceInfoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceInfoCopyWith<$Res> get deviceInfo {
    return $DeviceInfoCopyWith<$Res>(_value.deviceInfo, (value) {
      return _then(_value.copyWith(deviceInfo: value));
    });
  }
}

/// @nodoc

class _$DeviceInfoLoadedImpl implements DeviceInfoLoaded {
  const _$DeviceInfoLoadedImpl(this.deviceInfo);

  @override
  final DeviceInfo deviceInfo;

  @override
  String toString() {
    return 'DeviceInfoState.loaded(deviceInfo: $deviceInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceInfoLoadedImpl &&
            (identical(other.deviceInfo, deviceInfo) ||
                other.deviceInfo == deviceInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deviceInfo);

  /// Create a copy of DeviceInfoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceInfoLoadedImplCopyWith<_$DeviceInfoLoadedImpl> get copyWith =>
      __$$DeviceInfoLoadedImplCopyWithImpl<_$DeviceInfoLoadedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(DeviceInfo deviceInfo) loaded,
    required TResult Function(DeviceInfo deviceInfo) batteryRefreshing,
    required TResult Function(String message) error,
  }) {
    return loaded(deviceInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(DeviceInfo deviceInfo)? loaded,
    TResult? Function(DeviceInfo deviceInfo)? batteryRefreshing,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(deviceInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(DeviceInfo deviceInfo)? loaded,
    TResult Function(DeviceInfo deviceInfo)? batteryRefreshing,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(deviceInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceInfoInitial value) initial,
    required TResult Function(DeviceInfoLoading value) loading,
    required TResult Function(DeviceInfoLoaded value) loaded,
    required TResult Function(DeviceInfoBatteryRefreshing value)
    batteryRefreshing,
    required TResult Function(DeviceInfoError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceInfoInitial value)? initial,
    TResult? Function(DeviceInfoLoading value)? loading,
    TResult? Function(DeviceInfoLoaded value)? loaded,
    TResult? Function(DeviceInfoBatteryRefreshing value)? batteryRefreshing,
    TResult? Function(DeviceInfoError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceInfoInitial value)? initial,
    TResult Function(DeviceInfoLoading value)? loading,
    TResult Function(DeviceInfoLoaded value)? loaded,
    TResult Function(DeviceInfoBatteryRefreshing value)? batteryRefreshing,
    TResult Function(DeviceInfoError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class DeviceInfoLoaded implements DeviceInfoState {
  const factory DeviceInfoLoaded(final DeviceInfo deviceInfo) =
      _$DeviceInfoLoadedImpl;

  DeviceInfo get deviceInfo;

  /// Create a copy of DeviceInfoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeviceInfoLoadedImplCopyWith<_$DeviceInfoLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeviceInfoBatteryRefreshingImplCopyWith<$Res> {
  factory _$$DeviceInfoBatteryRefreshingImplCopyWith(
    _$DeviceInfoBatteryRefreshingImpl value,
    $Res Function(_$DeviceInfoBatteryRefreshingImpl) then,
  ) = __$$DeviceInfoBatteryRefreshingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DeviceInfo deviceInfo});

  $DeviceInfoCopyWith<$Res> get deviceInfo;
}

/// @nodoc
class __$$DeviceInfoBatteryRefreshingImplCopyWithImpl<$Res>
    extends
        _$DeviceInfoStateCopyWithImpl<$Res, _$DeviceInfoBatteryRefreshingImpl>
    implements _$$DeviceInfoBatteryRefreshingImplCopyWith<$Res> {
  __$$DeviceInfoBatteryRefreshingImplCopyWithImpl(
    _$DeviceInfoBatteryRefreshingImpl _value,
    $Res Function(_$DeviceInfoBatteryRefreshingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DeviceInfoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? deviceInfo = null}) {
    return _then(
      _$DeviceInfoBatteryRefreshingImpl(
        null == deviceInfo
            ? _value.deviceInfo
            : deviceInfo // ignore: cast_nullable_to_non_nullable
                  as DeviceInfo,
      ),
    );
  }

  /// Create a copy of DeviceInfoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceInfoCopyWith<$Res> get deviceInfo {
    return $DeviceInfoCopyWith<$Res>(_value.deviceInfo, (value) {
      return _then(_value.copyWith(deviceInfo: value));
    });
  }
}

/// @nodoc

class _$DeviceInfoBatteryRefreshingImpl implements DeviceInfoBatteryRefreshing {
  const _$DeviceInfoBatteryRefreshingImpl(this.deviceInfo);

  @override
  final DeviceInfo deviceInfo;

  @override
  String toString() {
    return 'DeviceInfoState.batteryRefreshing(deviceInfo: $deviceInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceInfoBatteryRefreshingImpl &&
            (identical(other.deviceInfo, deviceInfo) ||
                other.deviceInfo == deviceInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deviceInfo);

  /// Create a copy of DeviceInfoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceInfoBatteryRefreshingImplCopyWith<_$DeviceInfoBatteryRefreshingImpl>
  get copyWith =>
      __$$DeviceInfoBatteryRefreshingImplCopyWithImpl<
        _$DeviceInfoBatteryRefreshingImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(DeviceInfo deviceInfo) loaded,
    required TResult Function(DeviceInfo deviceInfo) batteryRefreshing,
    required TResult Function(String message) error,
  }) {
    return batteryRefreshing(deviceInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(DeviceInfo deviceInfo)? loaded,
    TResult? Function(DeviceInfo deviceInfo)? batteryRefreshing,
    TResult? Function(String message)? error,
  }) {
    return batteryRefreshing?.call(deviceInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(DeviceInfo deviceInfo)? loaded,
    TResult Function(DeviceInfo deviceInfo)? batteryRefreshing,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (batteryRefreshing != null) {
      return batteryRefreshing(deviceInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceInfoInitial value) initial,
    required TResult Function(DeviceInfoLoading value) loading,
    required TResult Function(DeviceInfoLoaded value) loaded,
    required TResult Function(DeviceInfoBatteryRefreshing value)
    batteryRefreshing,
    required TResult Function(DeviceInfoError value) error,
  }) {
    return batteryRefreshing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceInfoInitial value)? initial,
    TResult? Function(DeviceInfoLoading value)? loading,
    TResult? Function(DeviceInfoLoaded value)? loaded,
    TResult? Function(DeviceInfoBatteryRefreshing value)? batteryRefreshing,
    TResult? Function(DeviceInfoError value)? error,
  }) {
    return batteryRefreshing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceInfoInitial value)? initial,
    TResult Function(DeviceInfoLoading value)? loading,
    TResult Function(DeviceInfoLoaded value)? loaded,
    TResult Function(DeviceInfoBatteryRefreshing value)? batteryRefreshing,
    TResult Function(DeviceInfoError value)? error,
    required TResult orElse(),
  }) {
    if (batteryRefreshing != null) {
      return batteryRefreshing(this);
    }
    return orElse();
  }
}

abstract class DeviceInfoBatteryRefreshing implements DeviceInfoState {
  const factory DeviceInfoBatteryRefreshing(final DeviceInfo deviceInfo) =
      _$DeviceInfoBatteryRefreshingImpl;

  DeviceInfo get deviceInfo;

  /// Create a copy of DeviceInfoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeviceInfoBatteryRefreshingImplCopyWith<_$DeviceInfoBatteryRefreshingImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeviceInfoErrorImplCopyWith<$Res> {
  factory _$$DeviceInfoErrorImplCopyWith(
    _$DeviceInfoErrorImpl value,
    $Res Function(_$DeviceInfoErrorImpl) then,
  ) = __$$DeviceInfoErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$DeviceInfoErrorImplCopyWithImpl<$Res>
    extends _$DeviceInfoStateCopyWithImpl<$Res, _$DeviceInfoErrorImpl>
    implements _$$DeviceInfoErrorImplCopyWith<$Res> {
  __$$DeviceInfoErrorImplCopyWithImpl(
    _$DeviceInfoErrorImpl _value,
    $Res Function(_$DeviceInfoErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DeviceInfoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$DeviceInfoErrorImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$DeviceInfoErrorImpl implements DeviceInfoError {
  const _$DeviceInfoErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'DeviceInfoState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceInfoErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of DeviceInfoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceInfoErrorImplCopyWith<_$DeviceInfoErrorImpl> get copyWith =>
      __$$DeviceInfoErrorImplCopyWithImpl<_$DeviceInfoErrorImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(DeviceInfo deviceInfo) loaded,
    required TResult Function(DeviceInfo deviceInfo) batteryRefreshing,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(DeviceInfo deviceInfo)? loaded,
    TResult? Function(DeviceInfo deviceInfo)? batteryRefreshing,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(DeviceInfo deviceInfo)? loaded,
    TResult Function(DeviceInfo deviceInfo)? batteryRefreshing,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceInfoInitial value) initial,
    required TResult Function(DeviceInfoLoading value) loading,
    required TResult Function(DeviceInfoLoaded value) loaded,
    required TResult Function(DeviceInfoBatteryRefreshing value)
    batteryRefreshing,
    required TResult Function(DeviceInfoError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceInfoInitial value)? initial,
    TResult? Function(DeviceInfoLoading value)? loading,
    TResult? Function(DeviceInfoLoaded value)? loaded,
    TResult? Function(DeviceInfoBatteryRefreshing value)? batteryRefreshing,
    TResult? Function(DeviceInfoError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceInfoInitial value)? initial,
    TResult Function(DeviceInfoLoading value)? loading,
    TResult Function(DeviceInfoLoaded value)? loaded,
    TResult Function(DeviceInfoBatteryRefreshing value)? batteryRefreshing,
    TResult Function(DeviceInfoError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class DeviceInfoError implements DeviceInfoState {
  const factory DeviceInfoError(final String message) = _$DeviceInfoErrorImpl;

  String get message;

  /// Create a copy of DeviceInfoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeviceInfoErrorImplCopyWith<_$DeviceInfoErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
