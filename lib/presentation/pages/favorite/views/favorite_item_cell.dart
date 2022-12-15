import 'package:batru_house_rental/domain/entities/favorite/favorite_entity.dart';
import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:batru_house_rental/presentation/utilities/helper/number_format_helper.dart';
import 'package:batru_house_rental/presentation/widgets/image/image_with_border.dart';
import 'package:flutter/material.dart';

class FavoriteItemCell extends StatefulWidget {
  const FavoriteItemCell({
    required this.onTap,
    required this.onFavoriteTap,
    required this.favoriteEntity,
    Key? key,
  }) : super(key: key);
  final VoidCallback onFavoriteTap;
  final VoidCallback onTap;
  final FavoriteEntity favoriteEntity;
  @override
  State<FavoriteItemCell> createState() => _FavoriteItemCellState();
}

class _FavoriteItemCellState extends State<FavoriteItemCell> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImage(context),
            const SizedBox(height: 8),
            Text(
              widget.favoriteEntity.typeHouse,
              style: AppTextStyles.labelMediumLight.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.favoriteEntity.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.headingXSmall.copyWith(
                color: context.colors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${NumberFormatHelper.formatPrice(widget.favoriteEntity.rentalPrice)} VND',
              style: AppTextStyles.textMediumBold.copyWith(
                color: context.colors.contentSpecialText,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.favoriteEntity.address,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.textMedium.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return GestureDetector(
      onTap: widget.onFavoriteTap,
      child: ImageWithBorder(
        url: widget.favoriteEntity.url,
        borderRadius: BorderRadius.circular(10),
        tags: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: Icon(
              widget.favoriteEntity.isFavorite
                  ? Icons.favorite
                  : Icons.favorite_border_rounded,
              color: widget.favoriteEntity.isFavorite
                  ? context.colors.contentSpecialMain
                  : context.colors.action,
            ),
          ),
        ],
      ),
    );
  }
}
