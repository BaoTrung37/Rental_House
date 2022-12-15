import 'package:batru_house_rental/data/repositories/favorite/favorite_repository.dart';
import 'package:batru_house_rental/domain/use_case/use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';

class RemoveFavoriteUseCase extends FutureUseCase<String, void> {
  @override
  Future<void> run(String input) async {
    return injector.get<FavoriteRepository>().removeFavorite(input);
  }
}
