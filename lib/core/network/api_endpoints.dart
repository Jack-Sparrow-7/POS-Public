class ApiEndpoints {
  const ApiEndpoints._();

  static const String baseUrl = 'http://192.168.31.103:8080/api/v1';

  static const String customerAuthBase = '/auth/customers';
  static const String register = '$customerAuthBase/register';
  static const String login = '$customerAuthBase/login';
  static const String logout = '$customerAuthBase/logout';
  static const String currentUser = customerAuthBase;

  static String getMenu({required String storeId}) =>
      '/public/stores/$storeId/menu';
}
