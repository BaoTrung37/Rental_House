import 'package:batru_house_rental/domain/entities/article/article_entity.dart';
import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:batru_house_rental/presentation/utilities/helper/number_format_helper.dart';
import 'package:batru_house_rental/presentation/widgets/image/image_with_border.dart';
import 'package:flutter/material.dart';

class InfoRoomHorizontalCardItemItem extends StatelessWidget {
  const InfoRoomHorizontalCardItemItem({
    required this.onTap,
    required this.articleEntity,
    Key? key,
  }) : super(key: key);
  final mockThumbnail =
      'https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/other/cat_relaxing_on_patio_other/1800x1200_cat_relaxing_on_patio_other.jpg';
  final VoidCallback onTap;
  final ArticleEntity? articleEntity;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: SizedBox(
          width: double.infinity,
          height: 100,
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Row(
              children: [
                _buildImage(),
                const SizedBox(width: 8),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildTypeLabel(context),
                        const SizedBox(height: 4),
                        Expanded(
                          child: Row(
                            children: [
                              _buildInfoHouseTitle(context),
                            ],
                          ),
                        ),
                        _buildInfoStreet(context),
                        // _buildInfoDistrict(context),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 4),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget _buildInfoDistrict(BuildContext context) {
  //   return Text(
  //     'Quận Cầu Giấy.',
  //     maxLines: 1,
  //     overflow: TextOverflow.ellipsis,
  //     style: AppTextStyles.labelMediumLight.copyWith(
  //       color: context.colors.textSecondary,
  //     ),
  //   );
  // }

  Widget _buildInfoStreet(BuildContext context) {
    return Text(
      articleEntity?.house?.address.toString() ?? '',
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: AppTextStyles.labelSmallLight.copyWith(
        color: context.colors.textSecondary,
      ),
    );
  }

  Widget _buildInfoHouseTitle(BuildContext context) {
    return Text(
      articleEntity?.house?.title ?? 'Chưa có tiêu đề',
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: AppTextStyles.headingXXSmall.copyWith(
        color: context.colors.textPrimary,
      ),
    );
  }

  Widget _buildTypeLabel(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${articleEntity?.type?.name ?? ''}. ${articleEntity?.house?.capacity ?? ''}',
          style: AppTextStyles.labelSmallLight,
        ),
        Text(
          '${NumberFormatHelper.formatPrice(articleEntity?.house?.rentalPrice ?? 0)} VND',
          style: AppTextStyles.labelSmall.copyWith(
            color: context.colors.contentSpecialText,
          ),
        ),
      ],
    );
  }

  Widget _buildImage() {
    return ImageWithBorder(
      aspectRatio: 1.1,
      url: articleEntity?.imageList.first.url,
      borderRadius: BorderRadius.circular(10),
    );
  }
}
