import 'package:batru_house_rental/presentation/pages/chat/chat_state.dart';
import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatViewModel extends StateNotifier<ChatState> {
  ChatViewModel(
  ) : super(const ChatState());


  Future<void> initData() async {
    state = state.copyWith(loadingStatus: LoadingStatus.inProgress);
    // final chatList = await _getChatUseCase.run();
    state = state.copyWith(
      loadingStatus: LoadingStatus.success,
      // chatList: chatList,
    );
  }
}
