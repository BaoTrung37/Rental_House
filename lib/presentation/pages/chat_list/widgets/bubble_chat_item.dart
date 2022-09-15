import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:flutter/material.dart';

class BubbleChatItem extends StatelessWidget {
  const BubbleChatItem({
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
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
      ),
    );
  }

  Widget _buildTimestampLastMessage(BuildContext context) {
    return Text(
      '2 phút trước',
      style: AppTextStyles.textSmall.copyWith(
        color: context.colors.textSecondary,
      ),
    );
  }

  Widget _buildMessageRev(BuildContext context) {
    return Text(
      'Bạn có tin nhắn mới Bạn có tin nhắn mới Bạn có tin nhắn mới Bạn có tin nhắn mới',
      style: AppTextStyles.textSmall.copyWith(
        color: context.colors.textSecondary,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }

  Widget _buildUsernameText(BuildContext context) {
    return Text(
      'Bảo Trung',
      style: AppTextStyles.headingXSmallLight.copyWith(
        color: context.colors.textPrimary,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }

  Widget _buildAvatar() {
    return const CircleAvatar(
      minRadius: 21,
      backgroundImage: NetworkImage('https://picsum.photos/200'),
    );
  }
}
