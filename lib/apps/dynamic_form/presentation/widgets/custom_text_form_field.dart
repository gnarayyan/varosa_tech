import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:varosa_tech/apps/dynamic_form/models/dynamic_form_model.dart';
import 'package:varosa_tech/apps/dynamic_form/presentation/widgets/get_field_icon.dart';
import 'package:varosa_tech/themes/app_theme.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.input,
    this.value,
    this.error,
    required this.onChanged,
  });
  final FormInput input;
  final dynamic value;
  final String? error;
  final ValueChanged<dynamic> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: value?.toString() ?? '',
      onChanged: onChanged,
      keyboardType: input.validation?.numberOnly == true
          ? TextInputType.number
          : TextInputType.text,
      inputFormatters: input.validation?.numberOnly == true
          ? [FilteringTextInputFormatter.digitsOnly]
          : null,
      decoration: InputDecoration(
        hintText: 'Enter ${input.label.toLowerCase()}',
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
