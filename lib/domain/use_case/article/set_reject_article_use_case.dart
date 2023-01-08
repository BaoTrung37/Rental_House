import 'package:batru_house_rental/data/repositories/article/article_repository.dart';
import 'package:batru_house_rental/domain/use_case/use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';

class SetRejectArticleUseCase extends FutureUseCase<String, void> {
  @override
  Future<void> run(String input) async {
    await injector.get<ArticleRepository>().rejectArticleById(input);
  }
}
