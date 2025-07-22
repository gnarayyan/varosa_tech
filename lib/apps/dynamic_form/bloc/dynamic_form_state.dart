part of 'dynamic_form_bloc.dart';

sealed class DynamicFormState extends Equatable {
  const DynamicFormState();

  @override
  List<Object> get props => [];
}

class DynamicFormInitial extends DynamicFormState {}

class DynamicFormLoading extends DynamicFormState {}

class DynamicFormLoaded extends DynamicFormState {
  final DynamicForm form;
  final FormData formData;

  const DynamicFormLoaded({required this.form, required this.formData});

  @override
  List<Object> get props => [form, formData];

  DynamicFormLoaded copyWith({DynamicForm? form, FormData? formData}) {
    return DynamicFormLoaded(
      form: form ?? this.form,
      formData: formData ?? this.formData,
    );
  }
}

class DynamicFormSubmitting extends DynamicFormState {
  final DynamicForm form;
  final FormData formData;

  const DynamicFormSubmitting({required this.form, required this.formData});

  @override
  List<Object> get props => [form, formData];
}

class DynamicFormSubmitted extends DynamicFormState {
  final DynamicForm form;
  final FormData formData;

  const DynamicFormSubmitted({required this.form, required this.formData});

  @override
  List<Object> get props => [form, formData];
}

class DynamicFormError extends DynamicFormState {
  final String message;

  const DynamicFormError(this.message);

  @override
  List<Object> get props => [message];
}
