// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:batru_house_rental/domain/entities/report/report_entity.dart';
import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:batru_house_rental/presentation/utilities/helper/date_format_helper.dart';
import 'package:flutter/material.dart';

class ReportItemView extends StatelessWidget {
  const ReportItemView({
    required this.reportEntity,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final ReportEntity reportEntity;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: context.colors.action,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              reportEntity.title,
              style: AppTextStyles.headingXSmall,
            ),
            const SizedBox(height: 8),
            Text('Lý do: ${reportEntity.reason}',
                style: AppTextStyles.textMedium),
            const SizedBox(height: 8),
            Text(
                'Ngày tạo: ${reportEntity.createdAt.getPublishDatePastFormatString}',
                style: AppTextStyles.textMedium),
          ],
        ),
      ),
    );
  }
}
