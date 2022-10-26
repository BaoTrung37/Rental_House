import 'package:batru_house_rental/domain/use_case/chat/get_chat_room_list_use_case.dart';
import 'package:batru_house_rental/presentation/pages/chat/chat_state.dart';
import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatViewModel extends StateNotifier<ChatState> {
  ChatViewModel(
    this._getChatRoomListUseCase,
  ) : super(const ChatState());

  final GetChatRoomListUseCase _getChatRoomListUseCase;

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
