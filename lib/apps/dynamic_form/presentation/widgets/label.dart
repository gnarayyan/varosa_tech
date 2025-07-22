import 'package:flutter/material.dart';
import 'package:varosa_tech/apps/dynamic_form/models/dynamic_form_model.dart';
import 'package:varosa_tech/themes/app_theme.dart';

class Label extends StatelessWidget {
  const Label(this.input, {super.key});
  final FormInput input;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: input.label,
        style: AppTextStyles.bodyMedium.copyWith(
          color: AppColors.onSurface,
          fontWeight: FontWeight.w500,
        ),
        children: !input.required
            ? null
            : [
                TextSpan(
                  text: ' *',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.error,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
      ),
    );
  }
}
