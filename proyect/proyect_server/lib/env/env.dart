import 'package:envied/envied.dart';

part 'env.g.dart';

// ------------------- Environment SetUp ------------------------ \\
@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'API_USER') // ENVIRONMENT VARIABLE FOR API USER
  static const String apiUser = _Env.apiUser;

  @EnviedField(varName: 'API_PASSWORD') // ENVIRONMENT VARIABLE FOR API PASSWORD
  static const String apiPassword = _Env.apiPassword;
}