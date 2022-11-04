import 'package:batru_house_rental/data/repositories/chat/chat_message_repository.dart';
import 'package:batru_house_rental/domain/use_case/use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetChatMessageListByIdUseCase
    extends StreamUseCase<GetChatMessageListByIdInput, QuerySnapshot> {
  @override
  Stream<QuerySnapshot> run(GetChatMessageListByIdInput input) {
    return injector
        .get<ChatMessageRepository>()
        .getChatMessageListByRoomId(input);
  }
}

class GetChatMessageListByIdInput {
  GetChatMessageListByIdInput({
    required this.roomId,
    required this.limit,
  });
  final String roomId;
  final int limit;
}
