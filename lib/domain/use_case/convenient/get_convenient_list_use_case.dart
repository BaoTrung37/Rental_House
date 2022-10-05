import 'package:batru_house_rental/data/repositories/convenient/convenient_repository.dart';
import 'package:batru_house_rental/domain/entities/convenient/convenient_entity.dart';
import 'package:batru_house_rental/domain/use_case/use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';

class GetConvenientListUseCase
    extends FutureOutputUseCase<List<ConvenientEntity>> {
  @override
  Future<List<ConvenientEntity>> run() async {
    final convenients =
        await injector.get<ConvenientRepository>().getConvenients();
    return convenients
        .map((e) => ConvenientEntity(
              id: e.id,
              name: e.name,
              iconUrl: e.iconUrl,
            ))
        .toList();
  }
}
