import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:flutter/material.dart';

class HomeInfoRoomHorizontalCardItemView extends StatelessWidget {
  const HomeInfoRoomHorizontalCardItemView({
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final mockThumbnail =
      'https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/other/cat_relaxing_on_patio_other/1800x1200_cat_relaxing_on_patio_other.jpg';
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: SizedBox(
          width: double.infinity,
          height: 91.69,
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Row(
              children: [
                _buildImage(mockThumbnail),
                const SizedBox(width: 4),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTypeLabel(context),
                        const SizedBox(height: 4),
                        Expanded(child: _buildInfoHouseTitle(context)),
                        _buildInfoStreet(context),
                        _buildInfoDistrict(context),
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

  Widget _buildInfoDistrict(BuildContext context) {
    return Text(
      'Quận Cầu Giấy.',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: AppTextStyles.labelXSmallLight.copyWith(
        color: context.colors.textSecondary,
      ),
    );
  }

  Widget _buildInfoStreet(BuildContext context) {
    return Text(
      '123 Đường Phạm Hùng, Phường Trung Hoà, Quận Cầu Giấy.',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: AppTextStyles.labelXSmallLight.copyWith(
        color: context.colors.textSecondary,
      ),
    );
  }

  Widget _buildInfoHouseTitle(BuildContext context) {
    return Text(
      'Phòng cho thuê Đường Phạm Hùng, Quận Cầu Giấy',
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
        const Text(
          'Tìm người thuê. ',
          style: AppTextStyles.labelXSmallLight,
        ),
        Text(
          '5 triệu VND/phòng',
          style: AppTextStyles.labelXSmall.copyWith(
            color: context.colors.contentSpecialText,
          ),
        ),
      ],
    );
  }

  Widget _buildImage(String imageUrl) {
    return AspectRatio(
      aspectRatio: 1.1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
