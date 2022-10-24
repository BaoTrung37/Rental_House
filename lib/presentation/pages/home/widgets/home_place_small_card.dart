import 'package:batru_house_rental/domain/entities/district/district_entity.dart';
import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:flutter/material.dart';

class HomePlaceSmallCard extends StatelessWidget {
  const HomePlaceSmallCard({
    required this.district,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final VoidCallback onTap;
  final DistrictEntity district;
  final mockThumbnail =
      'https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/other/cat_relaxing_on_patio_other/1800x1200_cat_relaxing_on_patio_other.jpg';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Positioned.fill(child: _buildImage()),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _buildPlaceNameTitle(context),
          ),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        district.imageUrl ?? mockThumbnail,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildPlaceNameTitle(BuildContext context) {
    return Text(
      district.name,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
      style: AppTextStyles.textSmallBold.copyWith(
        color: context.colors.textContrastOnContrastBackground,
      ),
    );
  }
}
