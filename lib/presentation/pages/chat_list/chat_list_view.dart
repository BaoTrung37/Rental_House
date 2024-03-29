import 'package:batru_house_rental/data/providers/app_navigator_provider.dart';
import 'package:batru_house_rental/domain/entities/user/user_entity.dart';
import 'package:batru_house_rental/domain/use_case/auth/get_current_user_information_use_case.dart';
import 'package:batru_house_rental/domain/use_case/chat/get_chat_room_list_by_user_id_use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';
import 'package:batru_house_rental/presentation/navigation/app_routers.dart';
import 'package:batru_house_rental/presentation/pages/chat/chat_view.dart';
import 'package:batru_house_rental/presentation/pages/chat_list/chat_list_state.dart';
import 'package:batru_house_rental/presentation/pages/chat_list/chat_list_view_model.dart';
import 'package:batru_house_rental/presentation/pages/chat_list/views/bubble_chat_item.dart';
import 'package:batru_house_rental/presentation/pages/chat_list/views/chat_list_item_cell.dart';
import 'package:batru_house_rental/presentation/widgets/base_app_bar/base_app_bar.dart';
import 'package:batru_house_rental/presentation/widgets/infinite_list/infinite_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatListProvider =
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
  ChatListViewModel get _viewModel => ref.read(chatListProvider.notifier);

  @override
  void initState() {
    super.initState();
  }

  void _onTapChatItem(String roomId, UserEntity receiverUser) {
    ref.read(appNavigatorProvider).navigateTo(
          AppRoutes.chat,
          arguments: ChatArguments(
            roomId: roomId,
            receiverUser: receiverUser,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(chatListProvider);
    // ref.listen<ChatListState>(chatListProvider, (previous, next) {
    //   if (next.loadingStatus == LoadingStatus.error &&
    //       next.loadingStatus != previous?.loadingStatus) {
    //     showErrorSnackBar(
    //       context: context,
    //       errorMessage: 'Có lỗi xảy ra, vui lòng thử lại',
    //     );
    //   }
    //   if (next.shouldReLoadData) {
    //     _viewModel.initData();
    //     _viewModel.setShouldReloadData(false);
    //   }
    // });

    return Scaffold(
      appBar: const BaseAppBar.titleOnly(
        title: 'Tin nhắn',
      ),
      body: Column(
        children: [
          Expanded(
            child: InfiniteListView(
              canPullToRefresh: true,
              perPage: 10,
              emptyView: const Center(
                child: Text('Không có tin nhắn'),
              ),
              cellBuilder: _buildCell,
              getDatasources: (int pageKey, int perPage) async {
                final data = await _viewModel.getChatRoomList();
                return data;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCell(Datasource<dynamic> dataSource, int index) {
    if (dataSource is BubbleChatCell) {
      return GestureDetector(
        onTap: () {
          _onTapChatItem(
            dataSource.getData.chatRoomEntity.id,
            dataSource.getData.chatRoomEntity.receiverUser,
          );
        },
        child: BubbleChatItem(
          chatRoomEntity: dataSource.getData.chatRoomEntity,
        ),
      );
    } else {
      return Container();
    }
  }
}
