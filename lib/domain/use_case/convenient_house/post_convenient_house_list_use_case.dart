import 'package:batru_house_rental/data/models/convenient_house/convenient_house_reponse.dart';
import 'package:batru_house_rental/data/repositories/convenient_house/convenient_house_repository.dart';
import 'package:batru_house_rental/domain/use_case/use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';

class PostConvenientHouseListUseCase
    extends FutureUseCase<List<ConvenientHouseResponse>, void> {
  @override
  Future<void> run(List<ConvenientHouseResponse> input) async {
    await injector.get<ConvenientHouseRepository>().addConvenientHouse(input);
  }
}
