import 'package:batru_house_rental/data/repositories/house/house_repository.dart';
import 'package:batru_house_rental/domain/use_case/use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';

class PostAvailableHouseUseCase extends FutureUseCase<String, void> {
  @override
  Future<void> run(String input) async =>
      injector.get<HouseRepository>().postAvailableHouse(input);
}
