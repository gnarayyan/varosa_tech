import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:varosa_tech/themes/app_theme.dart';

class ErrorView extends StatelessWidget {
  const ErrorView(this.error, {super.key});
  final String error;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(LucideIcons.alertCircle, size: 16, color: AppColors.error),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            error,
            style: AppTextStyles.bodySmall.copyWith(color: AppColors.error),
          ),
        ),
      ],
    );
  }
}
