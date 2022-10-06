import 'package:batru_house_rental/data/repositories/commune/commune_repository.dart';
import 'package:batru_house_rental/domain/entities/commune/commune_entity.dart';
import 'package:batru_house_rental/domain/use_case/use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';

class GetCommuneListUseCase extends FutureUseCase<String, List<CommuneEntity>> {
  @override
  Future<List<CommuneEntity>> run(String input) async {
    final data = await injector.get<CommuneRepository>().getCommunetWithProvinceId(input);
    return data
        .map((e) => CommuneEntity(
              id: e.id,
              name: e.name,
              district: e.district,
              districtId: e.districtId,
            ))
        .toList();
  }
}