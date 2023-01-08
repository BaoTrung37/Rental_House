import 'package:batru_house_rental/data/repositories/post/post_repository.dart';
import 'package:batru_house_rental/domain/use_case/use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';

class UnPostAvailablePostUseCase extends FutureUseCase<String, void> {
  @override
  Future<void> run(String input) async =>
      injector.get<PostRepository>().unPostAvailablePost(input);
}
