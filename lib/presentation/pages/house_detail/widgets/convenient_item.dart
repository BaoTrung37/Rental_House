import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:flutter/material.dart';

class ConvenientItem extends StatelessWidget {
  const ConvenientItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Image(
            image: AssetImage(
              AppImages.tv,
            ),
          ),
        ),
        Text(
          'TV',
          style: AppTextStyles.textSmall.copyWith(
            color: context.colors.textPrimary,
          ),
        ),
      ],
    );
  }
}
