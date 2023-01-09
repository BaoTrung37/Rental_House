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
    return const Scaffold(
      appBar: BaseAppBar.titleOnly(title: 'Quản lý báo cáo'),
      body: Center(
        child: Text(''),
      ),
    );
  }
}
