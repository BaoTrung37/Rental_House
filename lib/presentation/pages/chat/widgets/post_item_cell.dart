// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:batru_house_rental/domain/entities/chat/chat_post_entity.dart';
import 'package:batru_house_rental/domain/use_case/chat/get_article_to_message_use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';
import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:batru_house_rental/presentation/utilities/helper/number_format_helper.dart';
import 'package:batru_house_rental/presentation/widgets/image/image_with_border.dart';
import 'package:flutter/material.dart';

class PostItemCell extends StatefulWidget {
  const PostItemCell({
    required this.onTap,
    this.roomId,
    this.chatId,
    Key? key,
  }) : super(key: key);

  final Function(String postId) onTap;
  final String? roomId;
  final String? chatId;

  @override
  State<PostItemCell> createState() => _PostItemCellState();
}

class _PostItemCellState extends State<PostItemCell> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ChatPostEntity>(
        future: injector.get<GetArticleToMessageUseCase>().run(
              GetArticleToMessageInput(
                roomId: widget.roomId!,
                chatId: widget.chatId!,
              ),
            ),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final chatPostEntity = snapshot.data!;
            return GestureDetector(
              onTap: () {
                widget.onTap(chatPostEntity.postId);
              },
              child: SizedBox(
                height: 330,
                width: 600,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildImage(context, chatPostEntity.url),
                      const SizedBox(height: 8),
                      Text(
                        chatPostEntity.typeHouse,
                        style: AppTextStyles.labelMediumLight.copyWith(
                          color: context.colors.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        chatPostEntity.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.headingXSmall.copyWith(
                          color: context.colors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${NumberFormatHelper.formatPrice(chatPostEntity.rentalPrice)} VND',
                        style: AppTextStyles.textMediumBold.copyWith(
                          color: context.colors.contentSpecialText,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        chatPostEntity.address,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.textMedium.copyWith(
                          color: context.colors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        });
  }

  Widget _buildImage(BuildContext context, String url) {
    return ImageWithBorder(
      url: url,
      borderRadius: BorderRadius.circular(10),
    );
  }
}
