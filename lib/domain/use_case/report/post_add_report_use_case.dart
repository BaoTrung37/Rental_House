import 'package:batru_house_rental/data/models/report/report_response.dart';
import 'package:batru_house_rental/data/repositories/report/report_repository.dart';
import 'package:batru_house_rental/domain/use_case/use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';

class PostAddReportUseCase extends FutureUseCase<ReportResponse, void> {
  @override
  Future<void> run(ReportResponse input) {
    return injector.get<ReportRepository>().addReport(input);
  }
}
