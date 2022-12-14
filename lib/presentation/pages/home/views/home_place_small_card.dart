import 'package:batru_house_rental/domain/entities/district/district_entity.dart';
import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:batru_house_rental/presentation/utilities/constants.dart';
import 'package:flutter/material.dart';

class HomePlaceSmallCard extends StatelessWidget {
  const HomePlaceSmallCard({
    required this.district,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final VoidCallback onTap;
  final DistrictEntity district;

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
        district.imageUrl ?? Constants.mockThumbnail,
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
