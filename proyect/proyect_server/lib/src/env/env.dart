import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'API_USER', obfuscate: true)
  static final String apiUser = _Env.apiUser;

  @EnviedField(varName: 'API_PASSWORD', obfuscate: true)
  static final String apiPassword = _Env.apiPassword;
}