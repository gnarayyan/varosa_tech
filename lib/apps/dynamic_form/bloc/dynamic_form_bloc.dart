import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../models/dynamic_form_model.dart';
import '../models/form_data_model.dart';
import '../models/form_data_source.dart';
import '../presentation/services/form_validation_service.dart';
part 'dynamic_form_event.dart';
part 'dynamic_form_state.dart';

class DynamicFormBloc extends Bloc<DynamicFormEvent, DynamicFormState> {
  final FormDataSource _formDataSource;

  DynamicFormBloc(this._formDataSource) : super(DynamicFormInitial()) {
    on<LoadForm>(_onLoadForm);
    on<UpdateFormValue>(_onUpdateFormValue);
    on<NextStep>(_onNextStep);
    on<PreviousStep>(_onPreviousStep);
    on<SubmitForm>(_onSubmitForm);
    on<ResetForm>(_onResetForm);
  }

  Future<void> _onLoadForm(
    LoadForm event,
    Emitter<DynamicFormState> emit,
  ) async {
    emit(DynamicFormLoading());
    try {
      final form = DynamicForm.fromJson(await _formDataSource.getFormJson());
      final formData = FormData.initial();

      // Initialize form with default values
      final initialValues = <String, dynamic>{};
      for (final step in form.steps) {
        for (final input in step.inputs) {
          if (input.defaultValue != null) {
            initialValues[input.key] = input.defaultValue;
          }
        }
      }

      final updatedFormData = formData.copyWith(values: initialValues);
      emit(DynamicFormLoaded(form: form, formData: updatedFormData));
    } catch (e) {
      emit(DynamicFormError('Failed to load form: $e'));
    }
  }

  void _onUpdateFormValue(
    UpdateFormValue event,
    Emitter<DynamicFormState> emit,
  ) {
    final currentState = state;
    if (currentState is DynamicFormLoaded) {
      final updatedFormData = currentState.formData.updateValue(
        event.key,
        event.value,
      );
      emit(currentState.copyWith(formData: updatedFormData));
    }
  }

  void _onNextStep(NextStep event, Emitter<DynamicFormState> emit) {
    final currentState = state;
    if (currentState is DynamicFormLoaded) {
      final currentStepIndex = currentState.formData.currentStep;
      final currentStep = currentState.form.steps[currentStepIndex];

      // Validate current step
      final errors = FormValidationService.validateStep(
        currentStep.inputs,
        currentState.formData.values,
      );

      if (errors.isNotEmpty) {
        final updatedFormData = currentState.formData.setErrors(errors);
        emit(currentState.copyWith(formData: updatedFormData));
        return;
      }

      // Move to next step
      if (currentStepIndex < currentState.form.steps.length - 1) {
        final updatedFormData = currentState.formData.nextStep();
        emit(currentState.copyWith(formData: updatedFormData));
      }
    }
  }

  void _onPreviousStep(PreviousStep event, Emitter<DynamicFormState> emit) {
    final currentState = state;
    if (currentState is DynamicFormLoaded) {
      if (currentState.formData.currentStep > 0) {
        final updatedFormData = currentState.formData.previousStep();
        emit(currentState.copyWith(formData: updatedFormData));
      }
    }
  }

  Future<void> _onSubmitForm(
    SubmitForm event,
    Emitter<DynamicFormState> emit,
  ) async {
    final currentState = state;
    if (currentState is DynamicFormLoaded) {
      emit(
        DynamicFormSubmitting(
          form: currentState.form,
          formData: currentState.formData,
        ),
      );

      try {
        final success = await _formDataSource.submitFormData(
          currentState.formData.values,
        );
        if (success) {
          final completedFormData = currentState.formData.complete();
          emit(
            DynamicFormSubmitted(
              form: currentState.form,
              formData: completedFormData,
            ),
          );
        } else {
          emit(const DynamicFormError('Failed to submit form'));
        }
      } catch (e) {
        emit(DynamicFormError('Failed to submit form: $e'));
      }
    }
  }

  void _onResetForm(ResetForm event, Emitter<DynamicFormState> emit) {
    final currentState = state;
    if (currentState is DynamicFormLoaded ||
        currentState is DynamicFormSubmitted) {
      add(LoadForm());
    }
  }
}
