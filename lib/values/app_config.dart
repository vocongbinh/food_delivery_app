class ApiConfig {
  ApiConfig._();

  static const token =
      "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJiaW5obmUiLCJpYXQiOjE3MTA2NjE3NjgsImV4cCI6MTcxMTg3MTM2OH0.i_3A-Y-Mh4cfPWWQ6py8_IhMM2DC4JDkobmsNQ5Sm3c";
  static const String baseUrl = "http://10.0.2.2:8080/api";
  static const Duration receiveTimeout = Duration(milliseconds: 15000);
  static const Duration connectionTimeout = Duration(milliseconds: 15000);
  static const String users = '/users';
  static const String posts = '/posts';
  static const String comments = '/comments';
  static const String order = '/order';
  static const String address = '/address';
  static const String dishType = '/dishType';
  static const header = {
    'token': 'Bearer $token',
    'content-Type': 'application/json',
  };
}
