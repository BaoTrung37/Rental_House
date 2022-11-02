import 'package:batru_house_rental/domain/use_case/chat/get_chat_message_list_by_room_id_use_case.dart';
import 'package:batru_house_rental/presentation/pages/chat/chat_state.dart';
import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatViewModel extends StateNotifier<ChatState> {
  ChatViewModel(
    this._getChatRoomListByUserIdUseCase,
  ) : super(const ChatState());

  final GetChatMessageListByIdUseCase _getChatRoomListByUserIdUseCase;

  // Stream<ChatEntity> getChatMessageListByRoomId(String roomId) {
  //   Stream<QuerySnapshot<Map<String, dynamic>>> si = _getChatRoomListByUserIdUseCase.run(
  //     GetChatMessageListByIdInput(
  //       roomId: roomId,
  //       limit: 10,
  //     ),
  //   );
  // }

  Stream<QuerySnapshot> getChatMessageListStream(
    String roomId,
    int limit,
  ) {
    return _getChatRoomListByUserIdUseCase.run(
      GetChatMessageListByIdInput(
        roomId: '123',
        limit: 10,
      ),
    );
  }

  Future<void> initData() async {
    try {
      // state = state.copyWith(loadingStatus: LoadingStatus.inProgress);
      // final chatList = await _getChatUseCase.run();
      // state = state.copyWith(
      //   loadingStatus: LoadingStatus.success,
      //   chatList: chatList,
      // );
    } catch (e) {
      debugPrint('ChatViewModel initData error: $e');
      state = state.copyWith(
        loadingStatus: LoadingStatus.error,
      );
    }
  }
}
