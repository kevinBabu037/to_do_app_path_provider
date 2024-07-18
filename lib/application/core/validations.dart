// validators.dart
String? validateTitle(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a title';
  }
  return null;
}

String? validateDueDate(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a due date';
  }
  // Add more complex validation logic here if needed, such as date format checks
  return null;
}
