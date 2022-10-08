import 'package:batru_house_rental/data/repositories/province/province_repository.dart';
import 'package:batru_house_rental/domain/entities/province/province_entity.dart';
import 'package:batru_house_rental/domain/use_case/use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';

class GetProvinceListUseCase extends FutureOutputUseCase<List<ProvinceEntity>> {
  @override
  Future<List<ProvinceEntity>> run() async {
    final provinces = await injector.get<ProvinceRepository>().getProvinces();
    return provinces
        .map((e) => ProvinceEntity(
              id: e.id,
              name: e.name,
            ))
        .toList();
  }
}
