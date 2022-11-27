import 'package:batru_house_rental/data/models/address/address_reponse.dart';
import 'package:batru_house_rental/data/repositories/address/address_repository.dart';
import 'package:batru_house_rental/domain/use_case/use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';

class PostAddressUseCase extends FutureUseCase<AddressResponse, void> {
  @override
  Future<void> run(AddressResponse input) async {
    await injector<AddressRepository>().postAddress(input);
  }
}
