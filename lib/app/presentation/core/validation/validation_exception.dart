class ValidationException implements Exception {
  String message;
  ValidationException(
    this.message,
  );
  String getMessage() {
    return message;
  }
}
