import 'package:batru_house_rental/data/models/favorite/favorite_response.dart';
import 'package:batru_house_rental/data/repositories/favorite/favorite_repository.dart';
import 'package:batru_house_rental/domain/use_case/use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';

class AddFavoriteUseCase extends FutureUseCase<FavoriteResponse, void> {
  @override
  Future<void> run(FavoriteResponse input) async {
    return injector.get<FavoriteRepository>().addFavorite(input);
  }
}
