import 'package:batru_house_rental/data/models/house_type/house_type_response.dart';
import 'package:batru_house_rental/data/repositories/house_type/house_type_repository.dart';
import 'package:batru_house_rental/domain/use_case/use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';

class PostHouseTypeUseCase extends FutureUseCase<HouseTypeResponse, void> {
  @override
  Future<void> run(HouseTypeResponse input) async {
    await injector<HouseTypeRepository>().addHouseType(input);
  }
}
