import 'package:batru_house_rental/domain/entities/image_house/image_house_entity.dart';
import 'package:batru_house_rental/domain/use_case/use_case.dart';

class GetImageHouseListUseCase
    extends FutureUseCase<String, List<ImageHouseEntity>> {
  @override
  Future<List<ImageHouseEntity>> run(String input) async {
    return [];
  }
}
