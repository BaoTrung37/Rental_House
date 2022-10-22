import 'package:batru_house_rental/domain/entities/convenient/convenient_entity.dart';
import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:flutter/material.dart';

class ConvenientListItem extends StatelessWidget {
  const ConvenientListItem({
    required this.convenientEntity,
    Key? key,
  }) : super(key: key);

  final ConvenientEntity convenientEntity;

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
          child: Image(
            image: NetworkImage(
              convenientEntity.iconUrl,
            ),
            fit: BoxFit.contain,
            color: context.colors.iconPrimary,
          ),
        ),
        Text(
          convenientEntity.name,
          textAlign: TextAlign.center,
          style: AppTextStyles.textSmall.copyWith(
            color: context.colors.textPrimary,
          ),
        ),
      ],
    );
  }
}
