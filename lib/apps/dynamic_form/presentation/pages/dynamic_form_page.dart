import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../../themes/app_theme.dart';
import '../../../../core/service_locator.dart';
import '../../models/dynamic_form_model.dart';
import '../../models/form_data_model.dart';
import '../../bloc/dynamic_form_bloc.dart';
import '../widgets/dynamic_form_field.dart';
import '../widgets/step_indicator.dart';
import '../widgets/review_step.dart';

@RoutePage()
class DynamicFormPage extends StatelessWidget {
  const DynamicFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<DynamicFormBloc>()..add(LoadForm()),
      child: const DynamicFormView(),
    );
  }
}

class DynamicFormView extends StatelessWidget {
  const DynamicFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Dynamic Form'),
        backgroundColor: AppColors.surface,
        elevation: 0,
        scrolledUnderElevation: 1,
        leading: IconButton(
          onPressed: () => context.router.pop(),
          icon: const Icon(LucideIcons.arrowLeft),
        ),
      ),
      body: BlocConsumer<DynamicFormBloc, DynamicFormState>(
        listener: (context, state) {
          if (state is DynamicFormError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  children: [
                    const Icon(LucideIcons.alertCircle, color: Colors.white),
                    const SizedBox(width: 8),
                    Expanded(child: Text(state.message)),
                  ],
                ),
                backgroundColor: AppColors.error,
              ),
            );
          } else if (state is DynamicFormSubmitted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Row(
                  children: [
                    Icon(LucideIcons.checkCircle, color: Colors.white),
                    SizedBox(width: 8),
                    Text('Form submitted successfully!'),
                  ],
                ),
                backgroundColor: AppColors.success,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is DynamicFormLoading) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Loading form...'),
                ],
              ),
            );
          }

          if (state is DynamicFormError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    LucideIcons.alertCircle,
                    size: 64,
                    color: AppColors.error,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Error Loading Form',
                    style: AppTextStyles.headlineSmall.copyWith(
                      color: AppColors.error,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    state.message,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: () =>
                        context.read<DynamicFormBloc>().add(LoadForm()),
                    icon: const Icon(LucideIcons.refreshCw),
                    label: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (state is DynamicFormLoaded ||
              state is DynamicFormSubmitting ||
              state is DynamicFormSubmitted) {
            final DynamicForm form = (state as dynamic).form;
            final FormData formData = (state as dynamic).formData;
            final isSubmitting = state is DynamicFormSubmitting;
            final isSubmitted = state is DynamicFormSubmitted;

            if (isSubmitted) {
              return _buildSuccessView(context);
            }

            return Column(
              children: [
                // Step indicator
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: StepIndicator(
                    currentStep: formData.currentStep,
                    totalSteps: form.steps.length,
                    stepTitles: form.titleList,
                  ),
                ),

                // Form content
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: _buildStepContent(
                      context,
                      form,
                      formData,
                      isSubmitting,
                    ),
                  ),
                ),

                // Navigation buttons
                _buildNavigationBar(context, form, formData, isSubmitting),
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildStepContent(
    BuildContext context,
    dynamic form,
    dynamic formData,
    bool isSubmitting,
  ) {
    final currentStep = form.steps[formData.currentStep];
    final isReviewStep = currentStep.inputs.isEmpty;

    if (isReviewStep) {
      return SingleChildScrollView(
        child: ReviewStep(form: form, formValues: formData.values),
      );
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Step title and description
          Text(
            currentStep.title,
            style: AppTextStyles.headlineSmall.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            currentStep.description,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 24),

          // Form fields
          ...currentStep.inputs.map((input) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: DynamicFormField(
                input: input,
                value: formData.values[input.key],
                error: formData.errors[input.key],
                onChanged: (value) {
                  context.read<DynamicFormBloc>().add(
                    UpdateFormValue(input.key, value),
                  );
                },
              ),
            );
          }).toList(),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildNavigationBar(
    BuildContext context,
    dynamic form,
    dynamic formData,
    bool isSubmitting,
  ) {
    final isFirstStep = formData.currentStep == 0;
    final isLastStep = formData.currentStep == form.steps.length - 1;
    final isReviewStep = form.steps[formData.currentStep].inputs.isEmpty;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Previous button
          if (!isFirstStep)
            Expanded(
              child: OutlinedButton.icon(
                onPressed: isSubmitting
                    ? null
                    : () => context.read<DynamicFormBloc>().add(PreviousStep()),
                icon: const Icon(LucideIcons.chevronLeft),
                label: const Text('Previous'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  side: BorderSide(color: AppColors.primary),
                  foregroundColor: AppColors.primary,
                ),
              ),
            ),

          if (!isFirstStep) const SizedBox(width: 12),

          // Next/Submit button
          Expanded(
            flex: isFirstStep ? 1 : 1,
            child: ElevatedButton.icon(
              onPressed: isSubmitting
                  ? null
                  : () {
                      if (isReviewStep) {
                        context.read<DynamicFormBloc>().add(SubmitForm());
                      } else {
                        context.read<DynamicFormBloc>().add(NextStep());
                      }
                    },
              icon: isSubmitting
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : Icon(
                      isReviewStep
                          ? LucideIcons.send
                          : LucideIcons.chevronRight,
                    ),
              label: Text(
                isSubmitting
                    ? 'Submitting...'
                    : isReviewStep
                    ? 'Submit'
                    : isLastStep
                    ? 'Review'
                    : 'Next',
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                disabledBackgroundColor: AppColors.primary.withOpacity(0.6),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessView(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.success.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                LucideIcons.checkCircle,
                size: 64,
                color: AppColors.success,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Form Submitted Successfully!',
              style: AppTextStyles.headlineMedium.copyWith(
                color: AppColors.success,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'Thank you for submitting your car insurance application. We will review your information and get back to you soon.',
              style: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () =>
                        context.read<DynamicFormBloc>().add(ResetForm()),
                    icon: const Icon(LucideIcons.refreshCw),
                    label: const Text('Fill Again'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      side: BorderSide(color: AppColors.primary),
                      foregroundColor: AppColors.primary,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => context.router.pop(),
                    icon: const Icon(LucideIcons.home),
                    label: const Text('Go Home'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
