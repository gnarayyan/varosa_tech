import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:varosa_tech/apps/dynamic_form/models/dynamic_form_model.dart';
import 'package:varosa_tech/apps/dynamic_form/presentation/widgets/get_field_icon.dart';
import 'package:varosa_tech/themes/app_theme.dart';

class ToggleField extends StatelessWidget {
  const ToggleField({
    super.key,
    required this.input,
    this.value,
    required this.onChanged,
  });
  final FormInput input;
  final dynamic value;
  final ValueChanged<dynamic> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.outline),
      ),
      child: Row(
        children: [
          Icon(
            getFieldIcon(input.key).icon ?? LucideIcons.toggleLeft,
            color: AppColors.primary,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              input.label,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.onSurface,
              ),
            ),
          ),
          Switch.adaptive(
            value: value == true,
            onChanged: onChanged,
            activeColor: AppColors.primary,
          ),
        ],
      ),
    );
  }
}
