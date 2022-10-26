import 'package:batru_house_rental/domain/use_case/chat/get_chat_room_list_use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';
import 'package:batru_house_rental/presentation/pages/chat/chat_state.dart';
import 'package:batru_house_rental/presentation/pages/chat/chat_view_model.dart';
import 'package:batru_house_rental/presentation/pages/chat/widgets/chat_input_view.dart';
import 'package:batru_house_rental/presentation/pages/chat/widgets/chat_item.dart';
import 'package:batru_house_rental/presentation/widgets/app_divider/app_divider.dart';
import 'package:batru_house_rental/presentation/widgets/base_app_bar/base_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatProvider = StateNotifierProvider<ChatViewModel, ChatState>(
  (ref) => ChatViewModel(
    injector.get<GetChatRoomListUseCase>(),
  ),
);

class ChatView extends ConsumerStatefulWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatViewState();
}

class _ChatViewState extends ConsumerState<ChatView> {
  ChatViewModel get _viewModel => ref.read(chatProvider.notifier);

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await _viewModel.initData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(chatProvider);

    return Scaffold(
      appBar: const BaseAppBar.titleAndBackButton(
        title: 'Bảo Trung',
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: state.chatList.length,
              itemBuilder: (context, index) {
                return ChatItem(
                  chatEntity: state.chatList[index],
                );
              },
            ),
          ),
          const AppDivider(),
          ChatInputView(
            onSendButtonTapped: (value) {
              print('text: $value');
            },
            // focusNode: focusNode,
          ),
        ],
      ),
    );
  }
}
