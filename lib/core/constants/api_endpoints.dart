class ApiEndpoints {
  static const String apiV1 = '/api/v1';

  static const String customersAuthBase = '$apiV1/auth/customers';
  static const String customerRegister = '$customersAuthBase/register';
  static const String customerLogin = '$customersAuthBase/login';
  static const String customerCurrentUser = customersAuthBase;
  static const String customerLogout = '$customersAuthBase/logout';

  const ApiEndpoints._();
}
