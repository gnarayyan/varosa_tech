import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class NativeButtonView extends StatelessWidget {
  final VoidCallback? onPressed;
  final double? width;
  final double? height;

  const NativeButtonView({super.key, this.onPressed, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    // This is used in the platform side to register the view.
    const String viewType = 'varosa_tech/native_button';

    // Pass parameters to the platform side.
    final Map<String, dynamic> creationParams = <String, dynamic>{};

    Widget platformView;

    if (defaultTargetPlatform == TargetPlatform.android) {
      platformView = AndroidView(
        viewType: viewType,
        layoutDirection: TextDirection.ltr,
        creationParams: creationParams,
        creationParamsCodec: const StandardMessageCodec(),
        onPlatformViewCreated: _onPlatformViewCreated,
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      platformView = UiKitView(
        viewType: viewType,
        layoutDirection: TextDirection.ltr,
        creationParams: creationParams,
        creationParamsCodec: const StandardMessageCodec(),
        onPlatformViewCreated: _onPlatformViewCreated,
      );
    } else {
      // Fallback for other platforms
      platformView = Container(
        width: width ?? 200,
        height: height ?? 50,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: GestureDetector(
            onTap: onPressed,
            child: const Text(
              'Refresh Battery',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
    }

    return SizedBox(
      width: width ?? 200,
      height: height ?? 50,
      child: platformView,
    );
  }

  void _onPlatformViewCreated(int id) {
    if (onPressed != null) {
      // Set up method channel to listen for button presses
      final MethodChannel channel = MethodChannel(
        'varosa_tech/native_button_$id',
      );
      channel.setMethodCallHandler((call) async {
        if (call.method == 'onButtonPressed') {
          onPressed!();
        }
      });
    }
  }
}
