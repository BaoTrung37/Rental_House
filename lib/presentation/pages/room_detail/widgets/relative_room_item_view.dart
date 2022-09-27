import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:flutter/material.dart';

class RelativeRoomItemView extends StatelessWidget {
  const RelativeRoomItemView({
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final VoidCallback onTap;
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
                'https://picsum.photos/200',
                fit: BoxFit.fill,
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
          const Text(
            'Cho thuê phòng trọ tại 123 Nguyễn Văn Cừ, Quận 5, TP.HCM',
            style: AppTextStyles.textMediumBold,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          Text(
            '2.000.000 đ/tháng',
            style: AppTextStyles.textMediumBold.copyWith(
              color: context.colors.contentSpecialMain,
            ),
          ),
          const SizedBox(height: 2),
          // const Text('Nguyễn Văn A', style: AppTextStyles.,),
          Text(
            '123 Đường Phạm Hùng, Phường Trung Hoà, Quận Cầu Giấy.',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.labelSmall.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
          Text(
            'Quận Cầu Giấy.',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.labelSmall.copyWith(
              color: context.colors.textSecondary,
            ),
          )
        ],
      ),
    );
  }
}
