import 'package:batru_house_rental/data/models/image_house/image_house_response.dart';
import 'package:batru_house_rental/data/repositories/image_house/image_house_repository.dart';
import 'package:batru_house_rental/domain/use_case/use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';

class PostImageHouseListUseCase
    extends FutureUseCase<List<ImageHouseResponse>, void> {
  @override
  Future<void> run(List<ImageHouseResponse> input) async {
    await injector.get<ImageHouseRepository>().postImageHouse(input);
  }
}
