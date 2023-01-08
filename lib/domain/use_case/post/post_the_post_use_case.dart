import 'package:batru_house_rental/data/models/post/post_response.dart';
import 'package:batru_house_rental/data/repositories/post/post_repository.dart';
import 'package:batru_house_rental/domain/use_case/use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';

class PostThePostUseCase extends FutureUseCase<PostResponse, void> {
  @override
  Future<void> run(PostResponse input) async {
    await injector.get<PostRepository>().addPost(input);
  }
}
