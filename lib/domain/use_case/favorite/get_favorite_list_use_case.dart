import 'package:batru_house_rental/data/repositories/favorite/favorite_repository.dart';
import 'package:batru_house_rental/domain/entities/favorite/favorite_entity.dart';
import 'package:batru_house_rental/domain/use_case/use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';

class GetFavoriteListUsecase extends FutureUseCase<String, List<FavoriteEntity>> {
  @override
  Future<List<FavoriteEntity>> run(String input) async {
    return injector.get<FavoriteRepository>().getFavoriteList(input);
  }
}
