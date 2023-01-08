import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_report_state.freezed.dart';

@freezed
class AdminReportState with _$AdminReportState {
  const factory AdminReportState({
    @Default(LoadingStatus.initial) LoadingStatus status,
    String? appError,
  }) = _AdminReportState;
}
