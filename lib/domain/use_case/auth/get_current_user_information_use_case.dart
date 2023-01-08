import 'package:batru_house_rental/data/repositories/auth/auth_repository.dart';
import 'package:batru_house_rental/domain/entities/user/user_entity.dart';
import 'package:batru_house_rental/domain/use_case/use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';

class GetCurrentUserInformationUseCase extends FutureOutputUseCase<UserEntity> {
  @override
  Future<UserEntity> run() async {
    final userResponse =
        await injector.get<AuthRepository>().getCurrentUserInformation();
    return UserEntity(
      id: userResponse.id,
      name: userResponse.name,
      avatar: userResponse.avatar,
      phoneNumber: userResponse.phoneNumber,
      role: userResponse.role,
    );
  }
}
