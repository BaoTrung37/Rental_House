// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:batru_house_rental/data/models/chat/chat_post_response.dart';
import 'package:batru_house_rental/data/repositories/chat_message/chat_message_repository.dart';
import 'package:batru_house_rental/domain/use_case/use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';

class PostArticleToMessageUseCase
    extends FutureUseCase<PostArticleToMessageInput, void> {
  @override
  Future<void> run(PostArticleToMessageInput input) async {
    return injector.get<ChatMessageRepository>().postChatPostMessage(input);
  }
}

class PostArticleToMessageInput {
  PostArticleToMessageInput({
    required this.chatPostResponse,
    required this.chatId,
    required this.userId,
    required this.receiverId,
  });
  final ChatPostResponse chatPostResponse;
  final String chatId;
  final String userId;
  final String receiverId;
}
