import 'package:batru_house_rental/data/repositories/article/article_repository.dart';
import 'package:batru_house_rental/domain/entities/article/article_entity.dart';
import 'package:batru_house_rental/domain/use_case/use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';

class GetPenddingArticleListUseCase
    extends FutureUseCase<int, List<ArticleEntity>> {
  @override
  Future<List<ArticleEntity>> run(int input) async {
    return injector.get<ArticleRepository>().getPenddingArticles(input);
  }
}
