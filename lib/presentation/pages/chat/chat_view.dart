import 'package:batru_house_rental/domain/use_case/chat/get_chat_use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';
import 'package:batru_house_rental/presentation/pages/chat/chat_state.dart';
import 'package:batru_house_rental/presentation/pages/chat/chat_view_model.dart';
import 'package:batru_house_rental/presentation/pages/chat/widgets/chat_item.dart';
import 'package:batru_house_rental/presentation/widgets/base_app_bar/base_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _provider = StateNotifierProvider.autoDispose<ChatViewModel, ChatState>(
  (ref) => ChatViewModel(
    injector.get<GetChatUseCase>(),
  ),
);

class ChatView extends ConsumerStatefulWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatViewState();
}

class _ChatViewState extends ConsumerState<ChatView> {
  ChatViewModel get _viewModel => ref.read(_provider.notifier);

  @override
  void initState() {
    // TODO: implement initState
    _viewModel.initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(_provider);

    return Scaffold(
      appBar: const BaseAppBar.titleAndBackButton(
        title: 'Bảo Trung',
      ),
      body: ListView.builder(
        itemCount: state.chatList.length,
        itemBuilder: (context, index) {
          return ChatItem(
            chatEntity: state.chatList[index],
          );
        },
      ),
    );
  }
}
