// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:batru_house_rental/data/repositories/auth/auth_repository.dart';
import 'package:batru_house_rental/domain/use_case/use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';

class EmailLoginUseCase extends FutureUseCase<EmailLoginInput, bool> {
  @override
  Future<bool> run(EmailLoginInput input) async =>
      injector.get<AuthRepository>().signInWithEmail(input);
}

class EmailLoginInput {
  final String email;
  final String password;
  EmailLoginInput({
    required this.email,
    required this.password,
  });
}
