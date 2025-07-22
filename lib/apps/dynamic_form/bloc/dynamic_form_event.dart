part of 'dynamic_form_bloc.dart';



abstract class DynamicFormEvent extends Equatable {
  const DynamicFormEvent();

  @override
  List<Object> get props => [];
}

class LoadForm extends DynamicFormEvent {}

class UpdateFormValue extends DynamicFormEvent {
  final String key;
  final dynamic value;

  const UpdateFormValue(this.key, this.value);

  @override
  List<Object> get props => [key, value];
}

class NextStep extends DynamicFormEvent {}

class PreviousStep extends DynamicFormEvent {}

class SubmitForm extends DynamicFormEvent {}

class ResetForm extends DynamicFormEvent {}