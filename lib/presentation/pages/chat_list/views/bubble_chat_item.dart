import 'package:batru_house_rental/domain/entities/chat_room/chat_room_entity.dart';
import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:batru_house_rental/presentation/utilities/helper/date_format_helper.dart';
import 'package:flutter/material.dart';

class BubbleChatItem extends StatelessWidget {
  const BubbleChatItem({
    required this.chatRoomEntity,
    Key? key,
  }) : super(key: key);
  final ChatRoomEntity chatRoomEntity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: _buildAvatar(),
            ),
            const SizedBox(width: 12),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 23),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildUsernameText(context),
                    const SizedBox(height: 4),
                    _buildMessageRev(context),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 4),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 23,
                horizontal: 15,
              ),
              child: Column(
                children: [
                  _buildTimestampLastMessage(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimestampLastMessage(BuildContext context) {
    debugPrint(
        'chatRoomEntity.lastMessage.timestamp: ${chatRoomEntity.lastMessageTime.toString()}');
    return Text(
      chatRoomEntity.lastMessageTime.getPublishDatePastFormatString,
      style: AppTextStyles.textSmall.copyWith(
        color: context.colors.textSecondary,
      ),
    );
  }

  Widget _buildMessageRev(BuildContext context) {
    return Text(
      chatRoomEntity.lastMessage,
      style: AppTextStyles.textSmall.copyWith(
        color: context.colors.textSecondary,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }

  Widget _buildUsernameText(BuildContext context) {
    return Text(
      chatRoomEntity.receiverUser.name,
      style: AppTextStyles.headingXSmallLight.copyWith(
        color: context.colors.textPrimary,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }

  Widget _buildAvatar() {
    return CircleAvatar(
      minRadius: 21,
      backgroundImage: NetworkImage(chatRoomEntity.receiverUser.avatar),
    );
  }
}
