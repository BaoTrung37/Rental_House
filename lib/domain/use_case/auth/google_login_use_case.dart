import 'package:batru_house_rental/data/repositories/auth/auth_repository.dart';
import 'package:batru_house_rental/domain/use_case/use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';

class GoogleLoginUseCase extends FutureOutputUseCase<bool> {
  @override
  Future<bool> run() async => injector.get<AuthRepository>().signInWithGoogle();
}
