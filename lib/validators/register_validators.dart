class RegisterValidators {
  const RegisterValidators._();

  static String? validateName(String? value) {
    final name = value?.trim() ?? '';
    if (name.isEmpty) return 'Name is required';
    if (name.length < 3) return 'Name must be at least 3 characters';
    if (name.length > 100) return 'Name must be at most 100 characters';
    return null;
  }

  static String? validateMobileNumber(String? value) {
    final mobileNumber = value?.trim() ?? '';
    if (mobileNumber.isEmpty) return 'Mobile number is required';
    if (mobileNumber.length != 10) return 'Mobile number must be 10 digits';
    return null;
  }

  static String? validateEmail(String? value) {
    final email = value?.trim() ?? '';
    if (email.isEmpty) return 'Email is required';
    if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(email)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    final password = value ?? '';
    if (password.isEmpty) return 'Password is required';
    if (password.length < 6) return 'Password must be at least 6 characters';
    if (password.length > 128) return 'Password must be at most 128 characters';
    return null;
  }
}
