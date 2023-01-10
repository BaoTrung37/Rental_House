import 'package:batru_house_rental/domain/use_case/report/get_report_list_use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';
import 'package:batru_house_rental/presentation/pages/admin_report/admin_report_state.dart';
import 'package:batru_house_rental/presentation/pages/admin_report/admin_report_view_model.dart';
import 'package:batru_house_rental/presentation/pages/admin_report/widgets/report_item_view.dart';
import 'package:batru_house_rental/presentation/widgets/app_indicator/loading_view.dart';
import 'package:batru_house_rental/presentation/widgets/base_app_bar/base_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _provider = StateNotifierProvider<AdminReportViewModel, AdminReportState>(
  (ref) => AdminReportViewModel(
    injector.get<GetReportListUseCase>(),
  ),
);

class AdminReportView extends ConsumerStatefulWidget {
  const AdminReportView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AdminReportViewState();
}

class _AdminReportViewState extends ConsumerState<AdminReportView> {
  AdminReportViewModel get _viewModel => ref.read(_provider.notifier);
  AdminReportState get _state => ref.watch(_provider);

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      _viewModel.initData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar.titleOnly(title: 'Quản lý báo cáo'),
      body: LoadingView(
        status: _state.status,
        child: _buildReportList(),
      ),
    );
  }

  Widget _buildReportList() {
    final reportList = _state.reportList;
    return ListView.builder(
      itemBuilder: (context, index) => ReportItemView(
        reportEntity: reportList[index],
        onTap: () {},
      ),
      itemCount: reportList.length,
    );
  }
}
