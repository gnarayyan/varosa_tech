import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../../themes/app_theme.dart';
import '../../models/dynamic_form_model.dart';

class ReviewStep extends StatelessWidget {
  final DynamicForm form;
  final Map<String, dynamic> formValues;

  const ReviewStep({super.key, required this.form, required this.formValues});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Review Your Information',
          style: AppTextStyles.headlineSmall.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Please review all your information before submitting the form.',
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 24),

        // Review sections
        ...form.steps.take(form.steps.length - 1).map((step) {
          return _buildReviewSection(step);
        }).toList(),
      ],
    );
  }

  Widget _buildReviewSection(FormStep step) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.outline.withAlpha((0.5 * 255).toInt()),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                _getSectionIcon(step.title),
                color: AppColors.primary,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                step.title,
                style: AppTextStyles.titleMedium.copyWith(
                  color: AppColors.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          ...step.inputs.map((input) {
            final value = formValues[input.key];
            if (value == null) return const SizedBox.shrink();

            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      input.label,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.onSurfaceVariant,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 3,
                    child: Text(
                      _formatValue(input, value),
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.onSurface,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  String _formatValue(FormInput input, dynamic value) {
    switch (input.type) {
      case 'toggle':
        return (value as bool) ? 'Yes' : 'No';
      case 'text':
      case 'dropdown':
      default:
        return value.toString();
    }
  }

  IconData _getSectionIcon(String title) {
    switch (title.toLowerCase()) {
      case 'personal information':
        return LucideIcons.user;
      case 'vehicle details':
        return LucideIcons.car;
      case 'coverage preferences':
        return LucideIcons.umbrella;
      default:
        return LucideIcons.fileText;
    }
  }
}
