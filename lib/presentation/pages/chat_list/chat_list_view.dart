import 'package:batru_house_rental/data/providers/chat_navigator_provider.dart';
import 'package:batru_house_rental/presentation/navigation/app_routers.dart';
import 'package:batru_house_rental/presentation/pages/chat_list/chat_list_state.dart';
import 'package:batru_house_rental/presentation/pages/chat_list/chat_list_view_model.dart';
import 'package:batru_house_rental/presentation/pages/chat_list/widgets/bubble_chat_item.dart';
import 'package:batru_house_rental/presentation/widgets/base_app_bar/base_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _provider =
    StateNotifierProvider.autoDispose<ChatListViewModel, ChatListState>(
  (ref) => ChatListViewModel(),
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
    _viewModel.initData();
    super.initState();
  }

  void _onTapChatItem() {
    ref.read(chatNavigatorProvider).navigateTo(AppRoutes.chat);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar.titleOnly(
        title: 'Tin nhắn',
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => BubbleChatItem(
          onTap: _onTapChatItem,
        ),
        itemCount: 10,
      ),
    );
  }
}
