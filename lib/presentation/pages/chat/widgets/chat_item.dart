import 'package:batru_house_rental/domain/entities/chat/chat_entity.dart';
import 'package:batru_house_rental/presentation/pages/chat/widgets/image_item.dart';
import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({
    required this.chatEntity,
    required this.isMe,
    Key? key,
  }) : super(key: key);
  final ChatEntity chatEntity;
  final bool isMe;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      color: context.colors.backgroundPrimary,
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          _buildMessageBody(context),
        ],
      ),
    );
  }

  Container _buildMessageBody(BuildContext context) {
    return Container(
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
      // width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
        color: isMe
            ? context.colors.secondaryBackgroundPrimary
            : context.colors.backgroundSecondary,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(12),
          topRight: const Radius.circular(12),
          bottomLeft:
              isMe ? const Radius.circular(12) : const Radius.circular(0),
          bottomRight:
              !isMe ? const Radius.circular(12) : const Radius.circular(0),
        ),
      ),
      child: chatEntity.type == ChatType.message.value
          ? Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 17,
                vertical: 12,
              ),
              child: _buildMessage(context),
            )
          : chatEntity.type == ChatType.image.value
              ? _buildImage()
              : _buildRoomInfoMessage(),
    );
  }

  Widget _buildRoomInfoMessage() => const Text('info');

  Widget _buildImage() {
    return ImageItem(
      imageUrl: chatEntity.message,
      onTap: () {},
    );
  }

  Widget _buildMessage(BuildContext context) {
    return Text(
      chatEntity.message,
      textAlign: isMe ? TextAlign.end : TextAlign.start,
      style: AppTextStyles.textSmall.copyWith(
        color: context.colors.textPrimary,
      ),
    );
  }
}
