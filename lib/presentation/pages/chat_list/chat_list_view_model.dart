import 'package:batru_house_rental/domain/use_case/auth/get_current_user_information_use_case.dart';
import 'package:batru_house_rental/domain/use_case/chat/get_chat_room_list_by_user_id_use_case.dart';
import 'package:batru_house_rental/presentation/pages/chat_list/chat_list_state.dart';
import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatListViewModel extends StateNotifier<ChatListState> {
  ChatListViewModel(
    this._getChatRoomListByUserIdUseCase,
    this._getCurrentUserInformationUseCase,
  ) : super(const ChatListState());
  final GetChatRoomListByUserIdUseCase _getChatRoomListByUserIdUseCase;
  final GetCurrentUserInformationUseCase _getCurrentUserInformationUseCase;
  Future<void> initData() async {
    try {
      state = state.copyWith(loadingStatus: LoadingStatus.inProgress);
      final currentUser = await _getCurrentUserInformationUseCase.run();
      final chatRoomList =
          await _getChatRoomListByUserIdUseCase.run(currentUser.id);

      state = state.copyWith(
        chatRoomList: chatRoomList,
        loadingStatus: LoadingStatus.success,
      );
    } catch (e) {
      state = state.copyWith(
        loadingStatus: LoadingStatus.error,
      );
    }
  }
}
