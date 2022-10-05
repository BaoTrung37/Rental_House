import 'package:batru_house_rental/domain/entities/convenient/convenient_entity.dart';
import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:flutter/material.dart';

class ConvenientItem extends StatelessWidget {
  const ConvenientItem({
    required this.convenient,
    this.isSelected = true,
    Key? key,
  }) : super(key: key);
  final bool isSelected;
  final ConvenientEntity convenient;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color:
              isSelected ? context.colors.primaryMain : context.colors.border,
          width: 1,
        ),
        color: isSelected
            ? context.colors.backgroundPrimary
            : context.colors.backgroundSecondary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: Image(
              image: NetworkImage(
                convenient.iconUrl,
              ),
              fit: BoxFit.contain,
              color: isSelected
                  ? context.colors.iconPrimary
                  : context.colors.iconSecondary,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            convenient.name,
            style: AppTextStyles.textMedium.copyWith(
              color: isSelected
                  ? context.colors.textPrimary
                  : context.colors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
