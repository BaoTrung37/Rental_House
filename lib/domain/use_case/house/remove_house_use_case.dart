import 'package:batru_house_rental/data/repositories/article/article_repository.dart';
import 'package:batru_house_rental/domain/use_case/use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';

class RemoveHouseUseCase extends FutureUseCase<RemoveHouseInput, void> {
  @override
  Future<void> run(RemoveHouseInput input) async {
    await injector.get<ArticleRepository>().removeArticleById(input);
  }
}

class RemoveHouseInput {
  RemoveHouseInput({
    required this.houseId,
    required this.imageIdList,
    required this.convenientIdList,
    required this.houseTypeId,
  });
  final String houseId;
  final List<String> imageIdList;
  final List<String> convenientIdList;
  final String houseTypeId;
}
