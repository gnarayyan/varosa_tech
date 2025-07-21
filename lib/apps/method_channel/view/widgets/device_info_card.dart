import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:varosa_tech/apps/method_channel/view/widgets/info_row.dart';
import '../../../../themes/app_theme.dart';
import '../../models/device_info.dart';

class DeviceInfoCard extends StatelessWidget {
  final DeviceInfo deviceInfo;

  const DeviceInfoCard({super.key, required this.deviceInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.outline, width: 1),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          Text(
            'Device Information',
            style: AppTextStyles.headlineSmall.copyWith(
              color: AppColors.onSurface,
            ),
          ),
          InfoRow(
            icon: LucideIcons.battery,
            label: 'Battery Level',
            value: '${deviceInfo.batteryLevel}%',
            valueColor: _getBatteryColor(),
          ),

          InfoRow(
            icon: LucideIcons.smartphone,
            label: 'Device Model',
            value: deviceInfo.deviceModel,
          ),

          InfoRow(
            icon: deviceInfo.isCharging
                ? LucideIcons.batteryCharging
                : LucideIcons.batteryLow,
            label: 'Charging Status',
            value: deviceInfo.isCharging ? 'Charging' : 'Not Charging',
            valueColor: deviceInfo.isCharging
                ? AppColors.success
                : AppColors.onSurface,
          ),

          InfoRow(
            icon: LucideIcons.clock,
            label: 'System Time',
            value: _formatDateTime(deviceInfo.systemTime),
          ),
        ],
      ),
    );
  }


  Color _getBatteryColor() {
    if (deviceInfo.batteryLevel >= 70) {
      return AppColors.success;
    } else if (deviceInfo.batteryLevel >= 30) {
      return Colors.orange;
    } else {
      return AppColors.error;
    }
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.day.toString().padLeft(2, '0')}/'
        '${dateTime.month.toString().padLeft(2, '0')}/'
        '${dateTime.year} '
        '${dateTime.hour.toString().padLeft(2, '0')}:'
        '${dateTime.minute.toString().padLeft(2, '0')}:'
        '${dateTime.second.toString().padLeft(2, '0')}';
  }
}
