import 'package:batru_house_rental/domain/entities/article/article_entity.dart';
import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:batru_house_rental/presentation/utilities/helper/number_format_helper.dart';
import 'package:flutter/material.dart';

class RelativeHouseItemView extends StatelessWidget {
  const RelativeHouseItemView({
    required this.onTap,
    required this.articleEntity,
    Key? key,
  }) : super(key: key);
  final VoidCallback onTap;
  final ArticleEntity articleEntity;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                articleEntity.imageList.first.url,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            'TÌM NGƯỜI THUÊ.',
            style: AppTextStyles.labelXSmallLight.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
          const SizedBox(height: 2),
          Expanded(
            child: Text(
              articleEntity.house?.title ?? '',
              style: AppTextStyles.textMediumBold,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            '${NumberFormatHelper.formatShortPrice(articleEntity.house?.rentalPrice ?? 0)}/phòng',
            style: AppTextStyles.textMediumBold.copyWith(
              color: context.colors.contentSpecialMain,
            ),
          ),
          const SizedBox(height: 2),
          // const Text('Nguyễn Văn A', style: AppTextStyles.,),
          Text(
            articleEntity.house?.address ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.labelSmall.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
          // Text(
          //   'Quận Cầu Giấy.',
          //   maxLines: 1,
          //   overflow: TextOverflow.ellipsis,
          //   style: AppTextStyles.labelSmall.copyWith(
          //     color: context.colors.textSecondary,
          //   ),
          // )
        ],
      ),
    );
  }
}
