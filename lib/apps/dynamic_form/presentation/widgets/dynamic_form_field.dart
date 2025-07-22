import 'package:flutter/material.dart';
import 'package:varosa_tech/apps/dynamic_form/presentation/widgets/custom_drop_down.dart';
import 'package:varosa_tech/apps/dynamic_form/presentation/widgets/custom_text_form_field.dart';
import 'package:varosa_tech/apps/dynamic_form/presentation/widgets/error_view.dart';
import 'package:varosa_tech/apps/dynamic_form/presentation/widgets/label.dart';
import 'package:varosa_tech/apps/dynamic_form/presentation/widgets/toggle_field.dart';

import '../../models/dynamic_form_model.dart';

class DynamicFormField extends StatelessWidget {
  final FormInput input;
  final dynamic value;
  final String? error;
  final ValueChanged<dynamic> onChanged;

  const DynamicFormField({
    super.key,
    required this.input,
    required this.value,
    this.error,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Label(input),
        const SizedBox(height: 8),
        if (input.type == 'text')
          CustomTextFormField(
            input: input,
            value: value,
            error: error,
            onChanged: onChanged,
          ),
        if (input.type == 'dropdown')
          CustomDropDown(input: input, value: value, onChanged: onChanged),

        if (input.type == 'toggle')
          ToggleField(input: input, value: value, onChanged: onChanged),
        if (error != null) ...[const SizedBox(height: 4), ErrorView(error!)],
      ],
    );
  }
}
