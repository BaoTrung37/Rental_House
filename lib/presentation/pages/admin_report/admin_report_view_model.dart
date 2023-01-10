// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:batru_house_rental/domain/use_case/report/get_report_list_use_case.dart';
import 'package:batru_house_rental/presentation/pages/admin_report/admin_report_state.dart';
import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdminReportViewModel extends StateNotifier<AdminReportState> {
  AdminReportViewModel(
    this._getReportListUseCase,
  ) : super(const AdminReportState());

  final GetReportListUseCase _getReportListUseCase;

  Future<void> initData() async {
    try {
      state = state.copyWith(status: LoadingStatus.inProgress);
      final reportList = await _getReportListUseCase.run();
      
      state = state.copyWith(
        reportList: reportList,
        status: LoadingStatus.success,
      );
    } catch (e) {
      state = state.copyWith(status: LoadingStatus.error);
      debugPrint('Admin Report Init: $e');
    }
  }
}
