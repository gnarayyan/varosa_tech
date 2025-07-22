class FormData {
  final Map<String, dynamic> values;
  final Map<String, String?> errors;
  final int currentStep;
  final bool isCompleted;

  const FormData({
    required this.values,
    required this.errors,
    required this.currentStep,
    required this.isCompleted,
  });

  FormData.initial()
    : values = {},
      errors = {},
      currentStep = 0,
      isCompleted = false;

  FormData copyWith({
    Map<String, dynamic>? values,
    Map<String, String?>? errors,
    int? currentStep,
    bool? isCompleted,
  }) {
    return FormData(
      values: values ?? this.values,
      errors: errors ?? this.errors,
      currentStep: currentStep ?? this.currentStep,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  FormData updateValue(String key, dynamic value) {
    final newValues = Map<String, dynamic>.from(values);
    newValues[key] = value;

    final newErrors = Map<String, String?>.from(errors);
    newErrors.remove(key); // Clear error when value is updated

    return copyWith(values: newValues, errors: newErrors);
  }

  FormData setError(String key, String? error) {
    final newErrors = Map<String, String?>.from(errors);
    if (error != null) {
      newErrors[key] = error;
    } else {
      newErrors.remove(key);
    }

    return copyWith(errors: newErrors);
  }

  FormData setErrors(Map<String, String?> newErrors) {
    return copyWith(errors: Map<String, String?>.from(newErrors));
  }

  FormData nextStep() {
    return copyWith(currentStep: currentStep + 1);
  }

  FormData previousStep() {
    return copyWith(currentStep: currentStep - 1);
  }

  FormData complete() {
    return copyWith(isCompleted: true);
  }

  bool hasErrors() {
    return errors.values.any((error) => error != null && error.isNotEmpty);
  }

  bool hasErrorsForStep(List<String> stepKeys) {
    return stepKeys.any(
      (key) => errors[key] != null && errors[key]!.isNotEmpty,
    );
  }
}
