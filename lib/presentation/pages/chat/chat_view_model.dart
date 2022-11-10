import 'package:batru_house_rental/data/models/chat/chat_response.dart';
import 'package:batru_house_rental/domain/entities/chat/chat_entity.dart';
import 'package:batru_house_rental/domain/use_case/auth/get_current_user_information_use_case.dart';
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
  ) : super(const ChatState());

  final GetChatMessageListByIdUseCase _getChatRoomListByUserIdUseCase;
  final GetCurrentUserInformationUseCase _getCurrentUserInformationUseCase;
  final PostMessageUseCase _postMessageUseCase;

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

  Future<void> postMessage(String roomId, ChatType chatType) async {
    try {
      if (state.message == '') {
        return;
      }
      final currentUser = await _getCurrentUserInformationUseCase.run();
      await _postMessageUseCase.run(PostMessageInput(
        chatResponse: ChatResponse(
          createdAt: DateTime.now(),
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          message: state.message,
          senderId: currentUser.id,
          type: chatType.value,
        ),
        roomId: roomId,
      ));
      state = state.copyWith(
        message: '',
      );
    } catch (e) {
      debugPrint('ChatViewModel postMess error: $e');
      state = state.copyWith(
        loadingStatus: LoadingStatus.error,
      );
    }
  }

  void onTextChange(String text) {
    state = state.copyWith(
      message: text,
    );
  }

  // Future<void> initData() async {
  //   try {
  //     state = state.copyWith(loadingStatus: LoadingStatus.inProgress);
  //     final chatList = await _getChatUseCase.run();
  //     state = state.copyWith(
  //       loadingStatus: LoadingStatus.success,
  //       chatList: chatList,
  //     );
  //   } catch (e) {
  //     debugPrint('ChatViewModel initData error: $e');
  //     state = state.copyWith(
  //       loadingStatus: LoadingStatus.error,
  //     );
  //   }
  // }
}
