import 'package:batru_house_rental/data/models/article/article_response.dart';
import 'package:batru_house_rental/data/repositories/article/article_repository.dart';
import 'package:batru_house_rental/domain/use_case/use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';

class PostArticleUseCase extends FutureUseCase<ArticleResponse, void> {
  @override
  Future<void> run(ArticleResponse input) async {
    await injector.get<ArticleRepository>().addArticle(input);
  }
}
