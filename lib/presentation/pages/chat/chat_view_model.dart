import 'package:batru_house_rental/data/models/chat/chat_response.dart';
import 'package:batru_house_rental/domain/entities/chat/chat_entity.dart';
import 'package:batru_house_rental/domain/entities/chat/chat_post_entity.dart';
import 'package:batru_house_rental/domain/use_case/auth/get_current_user_information_use_case.dart';
import 'package:batru_house_rental/domain/use_case/chat/get_article_to_message_use_case.dart';
import 'package:batru_house_rental/domain/use_case/chat/get_chat_message_list_by_room_id_use_case.dart';
import 'package:batru_house_rental/domain/use_case/chat/post_message_use_case.dart';
import 'package:batru_house_rental/presentation/pages/chat/chat_state.dart';
import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatViewModel extends StateNotifier<ChatState> {
  ChatViewModel(
    this._getChatRoomListByUserIdUseCase,
    this._getCurrentUserInformationUseCase,
    this._postMessageUseCase,
    this._getArticleToMessageUseCase,
  ) : super(const ChatState());

  final GetChatMessageListByIdUseCase _getChatRoomListByUserIdUseCase;
  final GetCurrentUserInformationUseCase _getCurrentUserInformationUseCase;
  final PostMessageUseCase _postMessageUseCase;
  final GetArticleToMessageUseCase _getArticleToMessageUseCase;

  Stream<QuerySnapshot> getChatMessageListStream(
    String roomId,
    int limit,
  ) {
    return _getChatRoomListByUserIdUseCase.run(
      GetChatMessageListByIdInput(
        roomId: roomId,
        limit: limit,
      ),
    );
  }

  // Future<P> getArticle(String articleId) async {
  // return _getArticleToMessageUseCase.run(articleId);
  // }

  Future<ChatPostEntity> getChatPost(String chatId, String roomId) async {
    return _getArticleToMessageUseCase.run(
      GetArticleToMessageInput(chatId: chatId, roomId: roomId),
    );
  }

  Future<void> postMessage(
      String message, String roomId, ChatType chatType) async {
    try {
      if (message.isEmpty) {
        return;
      }
      final currentUser = await _getCurrentUserInformationUseCase.run();
      await _postMessageUseCase.run(PostMessageInput(
        chatResponse: ChatResponse(
          createdAt: DateTime.now(),
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          message: message,
          senderId: currentUser.id,
          type: chatType.value,
        ),
        roomId: roomId,
      ));
    } catch (e) {
      debugPrint('ChatViewModel postMess error: $e');
      state = state.copyWith(
        loadingStatus: LoadingStatus.error,
      );
    }
  }
}
