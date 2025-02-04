import 'package:covid_safe_app/configuration/authenticated_http_client.dart';

class AuthSingleton {
  AuthSingleton._privateConstructor();

  static final AuthSingleton _instance = AuthSingleton._privateConstructor();

  factory AuthSingleton() => _instance;

  final AuthenticatedHttpClient CustomHttpClient =
      new AuthenticatedHttpClient();
}
