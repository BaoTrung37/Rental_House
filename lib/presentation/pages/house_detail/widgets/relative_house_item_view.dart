import 'package:batru_house_rental/domain/entities/article/article_entity.dart';
import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:batru_house_rental/presentation/utilities/helper/number_format_helper.dart';
import 'package:batru_house_rental/presentation/widgets/image/image_with_border.dart';
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
          _buildImage(),
          const SizedBox(height: 2),
          Text(
            articleEntity.type?.name ?? 'Tìm người thuê',
            style: AppTextStyles.labelXSmallLight.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
          const SizedBox(height: 2),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                articleEntity.house?.title ?? '',
                style: AppTextStyles.textMediumBold,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
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

  Widget _buildImage() {
    return ImageWithBorder(
      borderRadius: BorderRadius.circular(10),
      url: articleEntity.imageList.first.url,
    );
  }
}
