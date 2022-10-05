import 'package:batru_house_rental/data/repositories/type/type_repository.dart';
import 'package:batru_house_rental/domain/entities/type/type_entity.dart';
import 'package:batru_house_rental/domain/use_case/use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';

class GetTypeListUseCase extends FutureOutputUseCase<List<TypeEntity>> {
  @override
  Future<List<TypeEntity>> run() async {
    final list = await injector.get<TypeRepository>().getTypes();
    return list
        .map((e) => TypeEntity(
              id: e.id,
              name: e.name,
            ))
        .toList();
  }
}
