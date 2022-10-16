import 'package:batru_house_rental/data/repositories/article/article_repository.dart';
import 'package:batru_house_rental/domain/use_case/use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';

class GetInitialArticleDataUseCase extends FutureOutputUseCase<void> {
  @override
  Future<void> run() async {
    await injector.get<ArticleRepository>().initData();
  }
}
