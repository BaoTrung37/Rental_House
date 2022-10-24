import 'package:batru_house_rental/data/repositories/auth/auth_repository.dart';
import 'package:batru_house_rental/domain/entities/user/user_entity.dart';
import 'package:batru_house_rental/domain/use_case/use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';

class GetUserByIdUseCase extends FutureUseCase<String, UserEntity> {
  @override
  Future<UserEntity> run(String input) async {
    final userResponse =
        await injector.get<AuthRepository>().getUserById(input);
    return userResponse.toEntity();
  }
}
