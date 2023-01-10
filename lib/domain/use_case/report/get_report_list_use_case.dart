import 'package:batru_house_rental/data/repositories/report/report_repository.dart';
import 'package:batru_house_rental/domain/entities/report/report_entity.dart';
import 'package:batru_house_rental/domain/use_case/use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';

class GetReportListUseCase extends FutureOutputUseCase<List<ReportEntity>> {
  @override
  Future<List<ReportEntity>> run() {
    return injector.get<ReportRepository>().getAllReport();
  }
}
