import 'package:batru_house_rental/data/models/house/house_response.dart';
import 'package:batru_house_rental/data/repositories/house/house_repository.dart';
import 'package:batru_house_rental/domain/use_case/use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';

class PostHouseUseCase extends FutureUseCase<HouseResponse, void> {
  @override
  Future<void> run(HouseResponse input) async {
    await injector.get<HouseRepository>().addHouse(input);
  }
}
