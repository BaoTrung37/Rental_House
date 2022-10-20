import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:flutter/material.dart';

enum ConvenientType {
  electricity,
  water,
  wifi,
  parking,
}

extension ConvenientComponent on ConvenientType {
  String get name {
    switch (this) {
      case ConvenientType.electricity:
        return 'Điện';
      case ConvenientType.water:
        return 'Nước';
      case ConvenientType.wifi:
        return 'Wifi';
      case ConvenientType.parking:
        return 'Bãi đỗ xe';
    }
  }

  String get iconUrl {
    switch (this) {
      case ConvenientType.electricity:
        return AppImages.electricity;
      case ConvenientType.water:
        return AppImages.water;
      case ConvenientType.wifi:
        return AppImages.wifi;
      case ConvenientType.parking:
        return AppImages.parking;
    }
  }
}

class ConvenientItem extends StatelessWidget {
  const ConvenientItem({
    required this.price,
    required this.type,
    Key? key,
  }) : super(key: key);

  final int price;
  final ConvenientType type;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Image(
            image: AssetImage(
              type.iconUrl,
            ),
            fit: BoxFit.cover,
          ),
        ),
        Text(
          price.toString(),
          textAlign: TextAlign.center,
          style: AppTextStyles.textSmall.copyWith(
            color: context.colors.textPrimary,
          ),
        ),
      ],
    );
  }
}
