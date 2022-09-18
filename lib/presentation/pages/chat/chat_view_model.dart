import 'package:batru_house_rental/domain/use_case/chat/get_chat_use_case.dart';
import 'package:batru_house_rental/presentation/pages/chat/chat_state.dart';
import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatViewModel extends StateNotifier<ChatState> {
  ChatViewModel(
    this._getChatUseCase,
  ) : super(const ChatState());

  final GetChatUseCase _getChatUseCase;

  Future<void> initData() async {
    state = state.copyWith(loadingStatus: LoadingStatus.inProgress);
    final chatList = await _getChatUseCase.run();
    state = state.copyWith(
      loadingStatus: LoadingStatus.success,
      chatList: chatList,
    );
  }
}