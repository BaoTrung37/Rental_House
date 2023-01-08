import 'package:batru_house_rental/data/repositories/article/article_repository.dart';
import 'package:batru_house_rental/domain/use_case/use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';

class SetApproveArticleUseCase
    extends FutureUseCase<SetApprovedArticleInput, void> {
  @override
  Future<void> run(SetApprovedArticleInput input) async {
    await injector.get<ArticleRepository>().approveArticleById(input);
  }
}

class SetApprovedArticleInput {
  SetApprovedArticleInput({
    required this.postId,
    required this.adminId,
  });
  final String postId;
  final String adminId;
}
