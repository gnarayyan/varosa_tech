import 'package:flutter/material.dart';
import 'package:varosa_tech/apps/dynamic_form/models/dynamic_form_model.dart';
import 'package:varosa_tech/apps/dynamic_form/presentation/widgets/get_field_icon.dart';
import 'package:varosa_tech/themes/app_theme.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
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
    return DropdownButtonFormField<String>(
      value: input.options?.contains(value) == true ? value : null,
      onChanged: onChanged,
      items: input.options?.map((option) {
        return DropdownMenuItem<String>(value: option, child: Text(option));
      }).toList(),
      decoration: InputDecoration(
        hintText: 'Select ${input.label.toLowerCase()}',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.error, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.error, width: 2),
        ),
        filled: true,
        fillColor: AppColors.surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        prefixIcon: getFieldIcon(input.key),
      ),
    );
  }
}
