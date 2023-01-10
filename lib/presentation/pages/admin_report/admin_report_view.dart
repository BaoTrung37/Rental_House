import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:batru_house_rental/presentation/widgets/base_app_bar/base_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdminReportView extends ConsumerStatefulWidget {
  const AdminReportView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AdminReportViewState();
}

class _AdminReportViewState extends ConsumerState<AdminReportView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar.titleOnly(title: 'Quản lý báo cáo'),
      body: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: context.colors.action,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              'Người dùng: hahahâhahahah đã báo cáo một bài đăng của người dùng: hiahiaihahiaih',
              style: AppTextStyles.headingXSmall,
            ),
            SizedBox(height: 8),
            Text('Lý do: ', style: AppTextStyles.textMedium),
            SizedBox(height: 8),
            Text('Ngày tạo: ', style: AppTextStyles.textMedium),
          ],
        ),
      ),
    );
  }
}
