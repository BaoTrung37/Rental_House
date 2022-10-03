import 'package:batru_house_rental/data/repositories/district/district_repository.dart';
import 'package:batru_house_rental/domain/entities/district/district_entity.dart';
import 'package:batru_house_rental/domain/use_case/use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';

class GetDistrictWithProvinceUseCase
    extends FutureUseCase<String, List<DistrictEntity>> {
  @override
  Future<List<DistrictEntity>> run(String input) async {
    final districts =
        await injector.get<DistrictRepository>().getDistrictWithProvince(input);
    return districts
        .map((e) => DistrictEntity(
              id: e.id,
              name: e.name,
              province: e.provinceId,
            ))
        .toList();
  }
}
