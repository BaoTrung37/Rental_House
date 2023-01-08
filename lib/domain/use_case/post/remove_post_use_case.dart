import 'package:batru_house_rental/data/repositories/article/article_repository.dart';
import 'package:batru_house_rental/domain/use_case/use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';

class RemovePostUseCase extends FutureUseCase<RemovePostInput, void> {
  @override
  Future<void> run(RemovePostInput input) async {
    await injector.get<ArticleRepository>().removeArticleById(input);
  }
}

class RemovePostInput {
  RemovePostInput({
    required this.postId,
    required this.imageIdList,
    required this.convenientIdList,
    required this.houseTypeId,
  });
  final String postId;
  final List<String> imageIdList;
  final List<String> convenientIdList;
  final String houseTypeId;
}
