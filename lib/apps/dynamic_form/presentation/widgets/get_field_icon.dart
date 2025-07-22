import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:varosa_tech/themes/app_theme.dart';

Icon getFieldIcon(String fieldName) {
  switch (fieldName) {
    case 'fullName':
      return Icon(LucideIcons.user, color: AppColors.primary);
    case 'age':
      return Icon(LucideIcons.calendar, color: AppColors.primary);
    case 'gender':
      return Icon(LucideIcons.users, color: AppColors.primary);
    case 'vehicleType':
      return Icon(LucideIcons.car, color: AppColors.primary);
    case 'vehicleYear':
      return Icon(LucideIcons.calendar, color: AppColors.primary);
    case 'hasExistingInsurance':
      return Icon(LucideIcons.shield, color: AppColors.primary);
    case 'coverageType':
      return Icon(LucideIcons.umbrella, color: AppColors.primary);
    case 'roadsideAssistance':
      return Icon(LucideIcons.helpCircle, color: AppColors.primary);
    default:
      return Icon(LucideIcons.fileText, color: AppColors.primary);
  }
}
