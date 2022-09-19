import 'package:batru_house_rental/presentation/pages/chat_list/chat_list_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatListViewModel extends StateNotifier<ChatListState> {
  ChatListViewModel() : super(const ChatListState());

  Future<void> initData() async {}
}
