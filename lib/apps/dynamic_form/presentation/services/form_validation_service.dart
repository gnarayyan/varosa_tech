import '../../models/dynamic_form_model.dart';

class FormValidationService {
  static String? validateInput(FormInput input, dynamic value) {
    // Check if required field is empty
    if (input.required && (value == null || value.toString().trim().isEmpty)) {
      return '${input.label} is required';
    }

    // Skip validation if value is empty and not required
    if (value == null || value.toString().trim().isEmpty) {
      return null;
    }

    // Apply specific validations
    if (input.validation?.numberOnly == true) {
      if (!_isNumeric(value.toString())) {
        return '${input.label} must be a number';
      }
    }

    // Additional validations based on input type
    switch (input.type) {
      case 'text':
        return _validateText(input, value.toString());
      case 'dropdown':
        return _validateDropdown(input, value.toString());
      case 'toggle':
        return null; // Toggle doesn't need validation
      default:
        return null;
    }
  }

  static Map<String, String?> validateStep(
    List<FormInput> inputs,
    Map<String, dynamic> values,
  ) {
    final errors = <String, String?>{};

    for (final input in inputs) {
      final value = values[input.key];
      final error = validateInput(input, value);
      if (error != null) {
        errors[input.key] = error;
      }
    }

    return errors;
  }

  static String? _validateText(FormInput input, String value) {
    if (value.trim().isEmpty) return null;

    // Validate age specifically
    if (input.key == 'age') {
      final age = int.tryParse(value);
      if (age == null) {
        return 'Age must be a valid number';
      }
      if (age < 1 || age > 120) {
        return 'Age must be between 1 and 120';
      }
    }

    // Validate vehicle year
    if (input.key == 'vehicleYear') {
      final year = int.tryParse(value);
      if (year == null) {
        return 'Year must be a valid number';
      }
      final currentYear = DateTime.now().year;
      if (year < 1900 || year > currentYear + 1) {
        return 'Year must be between 1900 and ${currentYear + 1}';
      }
    }

    // Validate full name
    if (input.key == 'fullName') {
      if (value.trim().length < 2) {
        return 'Full name must be at least 2 characters';
      }
      if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value.trim())) {
        return 'Full name can only contain letters and spaces';
      }
    }

    return null;
  }

  static String? _validateDropdown(FormInput input, String value) {
    if (input.options != null && !input.options!.contains(value)) {
      return 'Please select a valid ${input.label.toLowerCase()}';
    }
    return null;
  }

  static bool _isNumeric(String str) {
    return double.tryParse(str) != null;
  }
}
