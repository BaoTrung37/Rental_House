import 'package:batru_house_rental/domain/entities/house/house_entity.dart';
import 'package:batru_house_rental/domain/use_case/use_case.dart';

class GetHouseUseCase extends FutureUseCase<String, List<HouseEntity>> {
  @override
  Future<List<HouseEntity>> run(String input) async {
    return [];
  }
}
