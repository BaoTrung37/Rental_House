import 'package:batru_house_rental/data/models/chat/chat_response.dart';
import 'package:batru_house_rental/data/providers/app_navigator_provider.dart';
import 'package:batru_house_rental/domain/entities/chat/chat_entity.dart';
import 'package:batru_house_rental/domain/entities/user/user_entity.dart';
import 'package:batru_house_rental/domain/use_case/auth/get_current_user_information_use_case.dart';
import 'package:batru_house_rental/domain/use_case/chat/get_article_to_message_use_case.dart';
import 'package:batru_house_rental/domain/use_case/chat/get_chat_message_list_by_room_id_use_case.dart';
import 'package:batru_house_rental/domain/use_case/chat/post_message_use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';
import 'package:batru_house_rental/presentation/navigation/app_routers.dart';
import 'package:batru_house_rental/presentation/pages/article_detail/article_detail_view.dart';
import 'package:batru_house_rental/presentation/pages/chat/chat_state.dart';
import 'package:batru_house_rental/presentation/pages/chat/chat_view_model.dart';
import 'package:batru_house_rental/presentation/pages/chat/widgets/chat_input_view.dart';
import 'package:batru_house_rental/presentation/pages/chat/widgets/chat_item.dart';
import 'package:batru_house_rental/presentation/resources/app_colors.dart';
import 'package:batru_house_rental/presentation/widgets/app_divider/app_divider.dart';
import 'package:batru_house_rental/presentation/widgets/base_app_bar/base_app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatProvider =
    StateNotifierProvider.autoDispose<ChatViewModel, ChatState>(
  (ref) => ChatViewModel(
    injector.get<GetChatMessageListByIdUseCase>(),
    injector.get<GetCurrentUserInformationUseCase>(),
    injector.get<PostMessageUseCase>(),
    injector.get<GetArticleToMessageUseCase>(),
  ),
);

class ChatArguments {
  ChatArguments({
    required this.roomId,
    required this.receiverUser,
  });
  final String roomId;
  final UserEntity receiverUser;
}

class ChatView extends ConsumerStatefulWidget {
  const ChatView({
    required this.chatArguments,
    Key? key,
  }) : super(key: key);
  final ChatArguments chatArguments;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatViewState();
}

class _ChatViewState extends ConsumerState<ChatView> {
  ChatViewModel get _viewModel => ref.read(chatProvider.notifier);

  var _limit = 20;
  bool isShowScroll = false;
  final int _limitIncrement = 20;
  final ScrollController scrollController = ScrollController();
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      // await _viewModel.initData();
    });
    scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  void onSendMessage() {
    _viewModel.postMessage(
      textEditingController.text,
      widget.chatArguments.roomId,
      ChatType.message,
    );
  }

  void _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      setState(() {
        _limit += _limitIncrement;
      });
    }
    if (scrollController.offset == scrollController.position.minScrollExtent) {
      setState(() {
        isShowScroll = false;
      });
    } else {
      setState(() {
        isShowScroll = true;
      });
    }
  }

  void _scrollDown() {
    scrollController.animateTo(
      scrollController.position.minScrollExtent,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 500),
    );
    setState(() {
      isShowScroll = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final state = ref.watch(chatProvider);
    return Scaffold(
      appBar: BaseAppBar.titleAndBackButton(
        title: widget.chatArguments.receiverUser.name,
        onBackButtonTap: () {
          ref.read(appNavigatorProvider).goBack();
          // ref.read(chatListProvider.notifier).setShouldReloadData(true);
        },
      ),
      body: Column(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: _viewModel.getChatMessageListStream(
                widget.chatArguments.roomId, _limit),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if ((snapshot.data?.docs.length ?? 0) > 0) {
                  return Expanded(
                    child: _buildMessageList(snapshot),
                  );
                } else {
                  return const Expanded(
                    child: Center(
                      child: Text('No message ..'),
                    ),
                  );
                }
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          const AppDivider(),
          ChatInputView(
            onSendButtonTapped: (value) {
              _viewModel.postMessage(
                value,
                widget.chatArguments.roomId,
                ChatType.message,
              );
            },
            controller: textEditingController,
          ),
        ],
      ),
    );
  }

  Widget _buildMessageList(AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
    return Stack(
      children: [
        ListView.builder(
          reverse: true,
          controller: scrollController,
          itemBuilder: (context, index) =>
              _buildChatItem(context, snapshot.data?.docs[index]),
          itemCount: snapshot.data!.docs.length,
        ),
        if (isShowScroll)
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: CircleAvatar(
              maxRadius: 20,
              backgroundColor: context.colors.backgroundSecondary,
              child: IconButton(
                icon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: context.colors.iconSecondary,
                  size: 25,
                ),
                onPressed: () {
                  _scrollDown();
                },
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildChatItem(
      BuildContext context, DocumentSnapshot? documentSnapshot) {
    if (documentSnapshot != null) {
      final chatEntity =
          ChatResponse.fromJson(documentSnapshot.data() as Map<String, dynamic>)
              .toEntity();

      if (chatEntity.type == ChatType.post.name) {
        return ChatItem(
          chatEntity: chatEntity,
          chatPostOnTap: (postId) {
            ref.read(appNavigatorProvider).navigateTo(
                  AppRoutes.postDetail,
                  arguments: ArticleDetailArguments(
                    postId: postId,
                  ),
                );
            debugPrint('postId: $postId');
          },
          chatId: chatEntity.id,
          roomId: widget.chatArguments.roomId,
          isMe: chatEntity.senderId != widget.chatArguments.receiverUser.id,
        );
      }
      return ChatItem(
        chatEntity: chatEntity,
        // articleEntity: articleEntity,
        isMe: chatEntity.senderId != widget.chatArguments.receiverUser.id,
      );
    }
    return Container();
  }
}
