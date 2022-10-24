import 'package:batru_house_rental/data/models/image_house/image_house_response.dart';
import 'package:batru_house_rental/data/repositories/image_house/image_house_repository.dart';
import 'package:batru_house_rental/domain/use_case/use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';

class PostImageHouseListUseCase
    extends FutureUseCase<List<ImageHouseResponse>, void> {
  @override
  Future<void> run(List<ImageHouseResponse> input) async {
    // final imageRepo = injector.get<ImageHouseRepository>();
    // final list = input.map((e) async {
    //   final url = await imageRepo.getImageUrlDownload(e.imageFile);
    //   return ImageHouseResponse(id: e.id, houseId: e.houseId, url: url);
    // }).toList();
    // await imageRepo.postImageHouse(list);
    await injector.get<ImageHouseRepository>().postImageHouse(input);
  }
}

// class ImageHouseInput {
//   ImageHouseInput({
//     required this.id,
//     required this.url,
//     required this.houseId,
//   });
//   final String id;
//   final String url;
//   final String houseId;
// }
