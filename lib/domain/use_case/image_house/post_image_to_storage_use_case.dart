import 'dart:io';

import 'package:batru_house_rental/data/repositories/image_house/image_house_repository.dart';
import 'package:batru_house_rental/domain/use_case/use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';

class PostImageToStorageUseCase extends FutureUseCase<File, String> {
  @override
  Future<String> run(File input) async {
    return injector.get<ImageHouseRepository>().getImageUrlDownload(input);
  }
}
