import 'package:batru_house_rental/data/repositories/favorite/favorite_repository.dart';
import 'package:batru_house_rental/domain/use_case/use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';

class CheckFavoriteUseCase extends FutureUseCase<GetFavoriteInput, String?> {
  @override
  Future<String?> run(GetFavoriteInput input) async {
    return injector.get<FavoriteRepository>().checkFavorite(input);
  }
}

class GetFavoriteInput {
  GetFavoriteInput({
    required this.userId,
    required this.houseId,
  });
  final String userId;
  final String houseId;
}
