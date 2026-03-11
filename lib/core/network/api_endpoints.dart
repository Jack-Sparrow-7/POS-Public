class ApiEndpoints {
  const ApiEndpoints._();

  static const String baseUrl = 'http://localhost:8080/api/v1';

  static const String authBase = '/auth/customers';
  static const String register = '$authBase/register';
  static const String login = '$authBase/login';
  static const String logout = '$authBase/logout';
  static const String currentUser = authBase;
}
