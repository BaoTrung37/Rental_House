// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:batru_house_rental/data/repositories/chat_message/chat_message_repository.dart';
import 'package:batru_house_rental/domain/entities/chat/chat_post_entity.dart';
import 'package:batru_house_rental/domain/use_case/use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';

class GetArticleToMessageUseCase
    extends FutureUseCase<GetArticleToMessageInput, ChatPostEntity> {
  @override
  Future<ChatPostEntity> run(GetArticleToMessageInput input) {
    return injector.get<ChatMessageRepository>().getChatPostById(input);
  }
}

class GetArticleToMessageInput {
  final String roomId;
  final String chatId;
  GetArticleToMessageInput({
    required this.roomId,
    required this.chatId,
  });
}
