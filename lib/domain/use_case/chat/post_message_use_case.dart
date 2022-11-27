import 'package:batru_house_rental/data/models/chat/chat_response.dart';
import 'package:batru_house_rental/data/repositories/chat_message/chat_message_repository.dart';
import 'package:batru_house_rental/domain/use_case/use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';

class PostMessageUseCase extends FutureUseCase<PostMessageInput, void> {
  @override
  Future<void> run(PostMessageInput input) async {
    return injector.get<ChatMessageRepository>().postMessage(input);
  }
}

class PostMessageInput {
  PostMessageInput({
    required this.chatResponse,
    required this.roomId,
  });
  final ChatResponse chatResponse;
  final String roomId;
}
