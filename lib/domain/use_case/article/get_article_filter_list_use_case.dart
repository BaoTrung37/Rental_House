import 'package:batru_house_rental/data/repositories/article/article_repository.dart';
import 'package:batru_house_rental/domain/entities/article/article_entity.dart';
import 'package:batru_house_rental/domain/use_case/use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';

class GetArticleFilterListUseCase
    extends FutureUseCase<ArticleFilterInput, List<ArticleEntity>> {
  @override
  Future<List<ArticleEntity>> run(ArticleFilterInput input) {
    return injector.get<ArticleRepository>().getArticlesByFiled(input);
  }
}

class ArticleFilterInput {
  ArticleFilterInput({
    this.districtId,
    this.communeId,
    this.typeId,
    this.minPrice,
    this.maxPrice,
  });
  final String? districtId;
  final String? communeId;
  final String? typeId;
  final int? minPrice;
  final int? maxPrice;
}
