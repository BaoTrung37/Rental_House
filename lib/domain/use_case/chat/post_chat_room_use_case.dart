import 'package:batru_house_rental/data/repositories/chat/chat_repository.dart';
import 'package:batru_house_rental/domain/entities/chat/chat_entity.dart';
import 'package:batru_house_rental/domain/use_case/use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';

class PostChatRoomUseCase extends FutureUseCase<PostChatRoomInput, void> {
  @override
  Future<void> run(PostChatRoomInput input) {
    return injector.get<ChatRepository>().createChatRoom(input);
  }
}

class PostChatRoomInput {
  PostChatRoomInput({
    required this.userId,
    required this.receiverId,
    required this.chatEntity,
  });
  final String userId;
  final String receiverId;
  final ChatEntity chatEntity;
}
