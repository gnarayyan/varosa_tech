import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:varosa_tech/apps/method_channel/view/widgets/error_card.dart';
import 'package:varosa_tech/apps/method_channel/view/widgets/loading_card.dart';
import '../../../../core/service_locator.dart';
import '../../../../themes/app_theme.dart';
import '../../bloc/device_info_bloc.dart';
import '../widgets/device_info_card.dart';
import '../widgets/native_button_view.dart';

@RoutePage()
class MethodChannelPage extends StatelessWidget {
  const MethodChannelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<DeviceInfoBloc>()..add(LoadDeviceInfo()),
      child: const MethodChannelView(),
    );
  }
}

class MethodChannelView extends StatefulWidget {
  const MethodChannelView({super.key});

  @override
  State<MethodChannelView> createState() => _MethodChannelViewState();
}

class _MethodChannelViewState extends State<MethodChannelView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Method Channel'),
        backgroundColor: AppColors.background,
        elevation: 0,
        scrolledUnderElevation: 1,
        leading: IconButton(
          onPressed: () => context.back(),
          icon: const Icon(LucideIcons.arrowLeft),
        ),
        actions: [
          IconButton(
            onPressed: () =>
                context.read<DeviceInfoBloc>().add(LoadDeviceInfo()),
            icon: const Icon(LucideIcons.refreshCw),
            tooltip: 'Refresh All Data',
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header section
              // Text(
              //   'Native Integration',
              //   style: AppTextStyles.headlineMedium.copyWith(
              //     color: AppColors.primary,
              //   ),
              // ),
              // const SizedBox(height: 8),
              // Text(
              //   'Demonstrating MethodChannel and PlatformView integration for cross-platform native functionality.',
              //   style: AppTextStyles.bodyMedium.copyWith(
              //     color: AppColors.textSecondary,
              //   ),
              // ),
              // const SizedBox(height: 32),

              // Device info section
              Expanded(
                child: SingleChildScrollView(
                  child: BlocConsumer<DeviceInfoBloc, DeviceInfoState>(
                    listener: (context, state) {
                      if (state is DeviceInfoError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Row(
                              children: [
                                const Icon(
                                  LucideIcons.alertCircle,
                                  color: Colors.white,
                                  size: 16,
                                ),
                                const SizedBox(width: 8),
                                Text('Failed to refresh: ${state.message}'),
                              ],
                            ),
                            backgroundColor: AppColors.error,
                            duration: const Duration(seconds: 3),
                          ),
                        );
                      }
                      if (state is DeviceInfoBatteryRefreshing) {
                        // Show a success message
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Row(
                              children: [
                                Icon(
                                  LucideIcons.battery,
                                  color: Colors.white,
                                  size: 16,
                                ),
                                SizedBox(width: 8),
                                Text('Battery level refreshed!'),
                              ],
                            ),
                            backgroundColor: AppColors.success,
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (state is DeviceInfoLoading)
                            const LoadingCard()
                          else if (state is DeviceInfoError)
                            ErrorCard(
                              error: state.message,
                              onRetry: () => context.read<DeviceInfoBloc>().add(
                                LoadDeviceInfo(),
                              ),
                            )
                          else if (state is DeviceInfoLoaded)
                            DeviceInfoCard(deviceInfo: state.deviceInfo)
                          else if (state is DeviceInfoBatteryRefreshing)
                            DeviceInfoCard(deviceInfo: state.deviceInfo),

                          const SizedBox(height: 32),

                          // Native button section
                          Text(
                            'Native Button Integration',
                            style: AppTextStyles.titleLarge.copyWith(
                              color: AppColors.onSurface,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'This button is rendered using native platform views. Tap it to refresh the battery level.',
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                          const SizedBox(height: 16),

                          Center(
                            child: NativeButtonView(
                              onPressed: () => context
                                  .read<DeviceInfoBloc>()
                                  .add(RefreshBatteryOnly()),
                              width: 200,
                              height: 50,
                            ),
                          ),

                          const SizedBox(height: 32),

                          // Flutter button for comparison
                          Center(
                            child: SizedBox(
                              width: 200,
                              height: 50,
                              child: ElevatedButton.icon(
                                onPressed: () => context
                                    .read<DeviceInfoBloc>()
                                    .add(LoadDeviceInfo()),
                                icon: const Icon(LucideIcons.refreshCw),
                                label: const Text('Refresh All Data'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
