import 'package:batru_house_rental/domain/use_case/auth/get_current_user_information_use_case.dart';
import 'package:batru_house_rental/domain/use_case/chat/get_chat_room_list_by_user_id_use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';
import 'package:batru_house_rental/presentation/pages/chat_list/chat_list_state.dart';
import 'package:batru_house_rental/presentation/pages/chat_list/chat_list_view_model.dart';
import 'package:batru_house_rental/presentation/pages/chat_list/widgets/bubble_chat_item.dart';
import 'package:batru_house_rental/presentation/widgets/app_indicator/loading_view.dart';
import 'package:batru_house_rental/presentation/widgets/base_app_bar/base_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _provider =
    StateNotifierProvider.autoDispose<ChatListViewModel, ChatListState>(
  (ref) => ChatListViewModel(
    injector.get<GetChatRoomListByUserIdUseCase>(),
    injector.get<GetCurrentUserInformationUseCase>(),
  ),
);

class ChatListView extends ConsumerStatefulWidget {
  const ChatListView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatListViewState();
}

class _ChatListViewState extends ConsumerState<ChatListView> {
  ChatListViewModel get _viewModel => ref.read(_provider.notifier);

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero, () {
      _viewModel.initData();
    });
    super.initState();
  }

  void _onTapChatItem(String roomId) {
    // ref.read(appNavigatorProvider).navigateTo(
    //       AppRoutes.chat,
    //       arguments: ChatArguments(
    //         roomId: roomId,
    //       ),
    //     );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar.titleOnly(
        title: 'Tin nhắn',
      ),
      body: LoadingView(
        status: ref.watch(_provider).loadingStatus,
        child: _buildChatRoomList(),
      ),
    );
  }

  Widget _buildChatRoomList() {
    final chatRoomList = ref.watch(_provider).chatRoomList;
    debugPrint(chatRoomList.length.toString());
    return ListView.builder(
      itemBuilder: (context, index) => BubbleChatItem(
        onTap: () => _onTapChatItem(
          chatRoomList[index].id,
        ),
        chatRoomEntity: chatRoomList[index],
      ),
      itemCount: chatRoomList.length,
    );
  }
}
