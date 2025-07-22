class FormValidation {
  final bool? numberOnly;

  const FormValidation({this.numberOnly});

  factory FormValidation.fromJson(Map<String, dynamic> json) {
    return FormValidation(numberOnly: json['numberOnly'] as bool?);
  }

  Map<String, dynamic> toJson() {
    return {'numberOnly': numberOnly};
  }
}

class FormInput {
  final String key;
  final String type;
  final String label;
  final bool required;
  final dynamic defaultValue;
  final List<String>? options;
  final FormValidation? validation;

  const FormInput({
    required this.key,
    required this.type,
    required this.label,
    required this.required,
    this.defaultValue,
    this.options,
    this.validation,
  });

  factory FormInput.fromJson(Map<String, dynamic> json) {
    return FormInput(
      key: json['key'] as String,
      type: json['type'] as String,
      label: json['label'] as String,
      required: json['required'] as bool,
      defaultValue: json['default'],
      options: (json['options'] as List<dynamic>?)?.cast<String>(),
      validation: json['validation'] != null
          ? FormValidation.fromJson(json['validation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'type': type,
      'label': label,
      'required': required,
      'default': defaultValue,
      'options': options,
      'validation': validation?.toJson(),
    };
  }
}

class FormStep {
  final String title;
  final String description;
  final List<FormInput> inputs;

  const FormStep({
    required this.title,
    required this.description,
    required this.inputs,
  });

  factory FormStep.fromJson(Map<String, dynamic> json) {
    return FormStep(
      title: json['title'] as String,
      description: json['description'] as String,
      inputs: (json['inputs'] as List<dynamic>)
          .map((input) => FormInput.fromJson(input as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'inputs': inputs.map((input) => input.toJson()).toList(),
    };
  }
}

class DynamicForm {
  final String title;
  final List<FormStep> steps;

  const DynamicForm({required this.title, required this.steps});

  factory DynamicForm.fromJson(Map<String, dynamic> json) {
    final formData = json['form'] as Map<String, dynamic>;
    return DynamicForm(
      title: formData['title'] as String,
      steps: (formData['steps'] as List<dynamic>)
          .map((step) => FormStep.fromJson(step as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'form': {
        'title': title,
        'steps': steps.map((step) => step.toJson()).toList(),
      },
    };
  }

  List<String> get titleList {
    List<String> titles = [];
    for (var step in steps) {
      titles.add(step.title);
    }
    return titles;
  }
}
