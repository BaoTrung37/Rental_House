import 'package:batru_house_rental/data/repositories/auth/auth_repository.dart';
import 'package:batru_house_rental/domain/use_case/use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';

class GoogleLogoutUseCase extends OutputUseCase<Future> {
  @override
  Future run() async => injector.get<AuthRepository>().googleLogout();
}
