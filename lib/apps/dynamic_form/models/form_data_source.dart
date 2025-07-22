class FormDataSource {
  Future<Map<String, dynamic>> getFormJson() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 800));

    // Return the mock JSON data
    return {
      "form": {
        "title": "Car Insurance Application",
        "steps": [
          {
            "title": "Personal Information",
            "description": "Enter your basic personal details.",
            "inputs": [
              {
                "key": "fullName",
                "type": "text",
                "label": "Full Name",
                "required": true,
              },
              {
                "key": "age",
                "type": "text",
                "label": "Age",
                "required": true,
                "default": 18,
                "validation": {"numberOnly": true},
              },
              {
                "key": "gender",
                "type": "dropdown",
                "label": "Gender",
                "options": ["Male", "Female", "Other"],
                "required": true,
              },
            ],
          },
          {
            "title": "Vehicle Details",
            "description": "Provide information about your vehicle.",
            "inputs": [
              {
                "key": "vehicleType",
                "type": "dropdown",
                "label": "Vehicle Type",
                "default": "Motorbike",
                "options": ["Car", "Motorbike", "Truck"],
                "required": true,
              },
              {
                "key": "vehicleYear",
                "type": "text",
                "label": "Vehicle Manufacture Year",
                "required": true,
                "validation": {"numberOnly": true},
              },
              {
                "key": "hasExistingInsurance",
                "type": "toggle",
                "label": "Do you currently have insurance?",
                "default": false,
                "required": false,
              },
            ],
          },
          {
            "title": "Coverage Preferences",
            "description": "Select the type of coverage you prefer.",
            "inputs": [
              {
                "key": "coverageType",
                "type": "dropdown",
                "label": "Coverage Type",
                "options": ["Third-Party", "Comprehensive", "Own Damage Only"],
                "required": true,
              },
              {
                "key": "roadsideAssistance",
                "type": "toggle",
                "label": "Include Roadside Assistance?",
                "required": false,
              },
            ],
          },
          {
            "title": "Review & Submit",
            "description": "Review your inputs before submitting the form.",
            "inputs": [],
          },
        ],
      },
    };
  }

  Future<bool> submitFormData(Map<String, dynamic> formData) async {
    // Simulate network delay for submission
    await Future.delayed(const Duration(milliseconds: 1500));

    // Simulate a successful submission (in real app, this would make HTTP request)
    // print('Form submitted: $formData');
    return true;
  }
}
